/// Author: QP
/// Version: 1.0
/// Date:2021/08
/// HCC工具类
Class HCC.Util Extends %RegisteredObject
{

/// 建立HCC数据元视图
Query WSDataElement() As %SQLQuery [ SqlView ]
{
    SELECT category.parent as name,category._Default as category,descr._Default as description,format._Default as format,valueset._Default as valueset,dt._Default as datatype
from 
(SELECT parent, _Default
FROM %Dictionary.ParameterDefinition where parent %Startswith 'WS.DE.DE'
and name='Category') category,
(SELECT parent, _Default
FROM %Dictionary.ParameterDefinition where parent %Startswith 'WS.DE.DE'
and name='Description') descr,
(SELECT parent, _Default
FROM %Dictionary.ParameterDefinition where parent %Startswith 'WS.DE.DE'
and name='Format') format,
(SELECT parent, _Default
FROM %Dictionary.ParameterDefinition where parent %Startswith 'WS.DE.DE'
and name='ValueSet') valueset,
(SELECT parent, _Default
FROM %Dictionary.ParameterDefinition where parent %Startswith 'WS.DE.DE'
and name='WSDT') dt
where category.parent=valueset.parent
  and category.parent=descr.parent
  and category.parent=format.parent
  and category.parent=dt.parent
}

/// 记录日志
/// 输入参数:
/// pLogType - 日志类型
/// pAction - 操作
/// pDocNum - 文档号
/// pLogMsg - 日志内容
/// 例如:Log("Error","GenDoc","","")
ClassMethod Log(pLogType, pAction, pDocNum, pLogMsg, pSession = null)
{
    &SQL(
    Insert into HCC.log(type,action,docnum,msg,session) 
    values(:pLogType, :pAction, :pDocNum, :pLogMsg,:pSession)
    )
}

/// 记录互联互通服务调用记录
ClassMethod HCCSvrLog(pSvrType, pSession, pTS) As %Status
{
    #SQLCompile Select=ODBC 
    Set tRet = $$$OK
    &SQL(Insert into HCC_SVR.ServiceLog(ServiceType,Session,BeginTS) values(:pSvrType,:pSession,:pTS))
    Set:(SQLCODE '=0) tRet = $$$ERROR(-10001,"SQLCODE:"_SQLCODE)
    Return tRet
}

/// 更新互联互通服务调用记录的后台服务
/// 它通过查询session的状态更新“服务调用记录”的结束时间和状态
ClassMethod HCCSvrLogTask() As %Status
{
    Set tRet = $$$OK
    &SQL(UPDATE HCC_SVR.ServiceLog as log 
            SET EndTS= HCC.Util_UTCToLocal(h.TimeProcessed) ,Result = h.status
           FROM ens.messageheader h 
          WHERE log.EndTS is null
            AND h.id = log.session
            AND h.TimeProcessed is not null
        )
    Set:(SQLCODE <0) tRet = $$$ERROR(-10001,"SQLCODE:"_SQLCODE)
    Return tRet
}

/// 将UTC时间戳转为本地时间戳
/// Ensemble消息处理时间以UTC时间戳保存
ClassMethod UTCToLocal(pTS As %TimeStamp) As %TimeStamp [ SqlProc ]
{
   Quit $zdt($System.Util.UTCtoLocalWithZTIMEZONE($zdth(pTS,3)),3)
}

/// 从文档生成队列里取出文档号并执行文档生成操作的后台任务
ClassMethod CreateDocTask()
{
    Set ^HCC("DocGenTask")=1

    While 1
    {
        // 如果得到通知，停止后台进程
        Return:($G(^HCC("DocGenTask"))=0)
        
        // 获取下一个任务
        Set tTaskId = $O(^HCC.DocGenQueue(""))
        // 没有任务，休息5s后继续
        if (tTaskId="")
        {
            hang 5
            Continue
        }
        
        Lock +^HCC.DocGenQueue(tTaskId)
        
        Set tDocNum = $G(^HCC.DocGenQueue(tTaskId))
        Set tDocInfo = $G(^HCC.DocGenQueue(tTaskId,"DocInfo"))
        
        // 调用生成过程
        If (tDocNum'="")
        { 
            Do ..Log("Info","GenDoc",tDocNum,"文档生成开始")
            Set tSC = ..CreateDocument(tDocNum)
            If $$$ISOK(tSC)
            {
                Do ..Log("Info","GenDoc",tDocNum,"文档生成结束")
            }
            else
            {
                Do ..Log("Error","GenDoc",tDocNum,"文档生成错误:"_$SYSTEM.Status.GetErrorText(tSC))
            }
            Kill ^HCC.DocGenQueue(tTaskId)
        }
    }
}

/// 停止后台产生SQL互联互通文档的服务
ClassMethod StopCreateDocTask() As %Status
{
    Set ^HCC("DocGenTask")=0
    Quit $$$OK
}

/// 创建文档对象实例,转换为互联互通文档，并保存到文档仓库
ClassMethod CreateDocument(pDocNum As %String = "Doc1") As %Status
{
    try
    {
        Set tSC = $$$OK,tDocType=""
        #SQLCompile Select=ODBC 
        &SQL(SELECT DocumentType INTO :tDocType FROM HCC_SQL.Document WHERE DocumentNo=:pDocNum)
        If SQLCODE = 100
        {
            Return $$$ERROR(-10001,"SQL文档:"_pDocNum_"不存在!")
        }
        
        // 加载xsl转换文件
        Set tSplit=$Case($system.Version.GetOS(),"Windows":"\",:"/")
        Set tFilePath = $ZStrip($G(^HCC("XSLFilePath")), "<>W")
        if ($E(tFilePath,$L(tFilePath))'="\") || ($E(tFilePath,$L(tFilePath))'="/") 
        {
            Set tFilePath = tFilePath_tSplit
        }
        Set tXSL = tFilePath_"C00"_$Case($L(tDocType),1:"0"_tDocType,2:tDocType)_".xsl"
        If ('##class(%File).Exists(tXSL))
        {
            Return $$$ERROR(-10001,"xsl转换文件:"_tXSL_"不存在!")
        }
        
        // 产生SQL文档XML流对象
        Set tSQLStream = ""
        Set tSC = ##class(HCC.SQL.Tools).GenerateHCCDocument(pDocNum,.tSQLStream)
        if ($$$ISERR(tSC)) 
        {
            Return tSC
        }
        
        
        // 转换XML流对象为HCC文档, 并保存
        If $IsObject(tSQLStream) 
        {
            Do tSQLStream.Rewind()
            Set tDocument=##class(%Stream.GlobalCharacter).%New(),tParams="",tCompiledStyleSheet=""
            
            Set tSC=##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(tXSL,.tCompiledStyleSheet)
            Return:($$$ISERR(tSC)) tSC
            
            Set tSC=##class(%XML.XSLT.Transformer).TransformStreamWithCompiledXSL(tSQLStream,tCompiledStyleSheet,.tDocument,,.tParams)

            Return:($$$ISERR(tSC)) tSC
            D ..toUTF8(.tDocument)
            
            // 加载SQL文档
            Set tDocInfo=""
            Set tSQLDoc = ##class(HCC.SQL.Document).%OpenId(pDocNum)
            Return:('$IsObject(tSQLDoc)) $$$ERROR(-10001,"SQL文档:"_pDocNum_"不存在!")
            // 获得文档信息
            Set tSC = tSQLDoc.GenDocInfo(.tDocInfo)
            Do tSQLDoc.%Close()

            // 保存HCC文档到文档仓库
            //If $$$ISOK(tSC)
            //{
                Set tSC = ..UpdateDoc(tDocInfo,tDocument)
                Return:($$$ISERR(tSC)) tSC
                kill (tDocument,tCompiledStyleSheet)
            //}
        }

        Return $$$OK
    }
    catch (e)
    {
        Return e.AsStatus()
    }
}

/// 向互联互通生成队列压入要生成文档的文档号
ClassMethod PushDocGenQueue(pDocNum As %String) As %Status
{
    try
    {
        Set tDocInfo = ""
        Set tDoc = ##class(HCC.SQL.Document).%OpenId(pDocNum)
        Return:('$IsObject(tDoc)) $$$ERROR(-10001,"文档号"_pDocNum_"不存在!")
        
        Set tSC = tDoc.GenDocInfo(.tDocInfo)
        Return:($$$ISERR(tSC)) tSC
        Do tDoc.%Close()
        
        Set tSub = $I(^HCC.DocGenQueue)
        Set ^HCC.DocGenQueue(tSub)=pDocNum
        Set ^HCC.DocGenQueue(tSub,"DocInfo")=tDocInfo
        Return $$$OK
    }
    catch(e)
    {
        Return e.AsStatus()
    }
}

/// 获取文档的HTML展现
/// pDocNo: 文档号
/// pHTML: 输出的HTML
ClassMethod GetDocHTML(pDocNo, Output pHTML) As %Status
{
    #dim tSC As %Status = $$$OK    
    #dim e As %Exception.AbstractException    
    Try     
    {
        Set (tInput, pHTML) =""

        &SQL(SELECT Content into :tInput FROM HCC_DocRepository.LatestDocs WHERE DocId=:pDocNo)
        If SQLCODE = 100
        {
            Set pHTML = "文档"_pDocNo_"不存在!"
            Return tSC
        }
	     	
	     	d ##class(HCC.Utils.Anonymization).Do(tInput,.reText)
	     	s tInput = reText
        
        Set tSplit=$Case($system.Version.GetOS(),"Windows":"\",:"/")

        Set tXSL = $G(^HCC("XSLFilePath"))_tSplit_"C0032Viewer.xsl"
        If tInput '="" 
        {
            Set tInput = $P(tInput,"<?xml version=""1.0"" encoding=""UTF-8""?>",2)
            Set tParams="",tCompiledStyleSheet=""
            
            Set tSC=##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(tXSL,.tCompiledStyleSheet)
            If $$$ISERR(tSC) Quit
            
            Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(tInput,tCompiledStyleSheet,.pHTML,,.tParams)
            Set pHTML = $ZCVT(pHTML,"I","UTF8")
        }        
    } 
    Catch (e) 
    {        
        Set tSC=e.AsStatus()    
    }    
    Return tSC
}

/// 通过身份证号，获得患者主索引记录
/// pIDNo: 身份证号
/// pPatient: 患者主索引
ClassMethod GetPatientIndex(pIDNo As %String, Output pPatient As HCC.DocRepository.Patient) As %Status
{
    Set tSC=$$$ERROR(-10001,"未查到身份证为"_pIDNo_"的患者.")
    Set pPatient= ##class(HCC.DocRepository.Patient).UKPatCardIdIOpen(pIDNo)
    Set:($IsObject(pPatient)) tSC=$$$OK
    Return tSC
}

/// 互联互通文档更新到文档仓库
/// 针对历史文档批量加载更新，不调用文档注册服务
/// pDocInfo 是包含文档信息的JSON字符串
/// pDoc是文档内容
ClassMethod UpdateDoc(pDocInfo As %String, pDoc As %Stream.GlobalCharacter) As %Status
{
    try
    {
        Set tDocInfo = {}.%FromJSON(pDocInfo)

        // 获取患者
        Set tPatient=""
        Set tPatIDNo = tDocInfo.PatientIDNo
        Set tSC = ..GetPatientIndex(tPatIDNo,.tPatient)
        
        // 患者不存在，创建患者主索引
        if '$$$ISOK(tSC)
        {
            Set tPatient = ##class(HCC.DocRepository.Patient).%New()
            Set (tPatient.PatCardId,tPatient.PatId) = tPatIDNo
            Set tPatient.PatName = tDocInfo.PatientName
            Do tPatient.%Save()
        }
        
        //创建新仓库历史文档
        Set tDoc = ##class(HCC.DocRepository.AllDocs).%New()
        // 患者
        Set tDoc.Patient = tPatient
        // 文档内容
        Do pDoc.Rewind()
        while 'pDoc.AtEnd
        {
        Set tDoc.Content = tDoc.Content_pDoc.Read()
        }
        /// 门诊号标识
        Set tDoc.PatOutHosCode =tDocInfo.OutPatientNum
        /// 住院号标识
        Set tDoc.PatInHosCode =tDocInfo.InPatientNum
        /// 文档类型代码
        Set tDoc.DocCode=tDocInfo.DocType
        /// 消息创建时间
        Set tDoc.MsgCreatTime = $ZDATETIME($ZDATETIMEH($ZTIMESTAMP,-3),3,1,4)
        /// 文档保存的服务器时间
        Set tDoc.AddDate =tDoc.MsgCreatTime
        /// 发送系统标识
        Set tDoc.SenderId = "System"
        /// 文档流水号 文档唯一标识
        Set tDoc.DocId = tDocInfo.DocNum
        /// 文档类型名称
        Set tDoc.DocName = tDocInfo.DocName
        /// 文档生成日期时间
        Set tDoc.DocCreatTime=tDocInfo.DocCreatTime
        /// 文档版本号
        Set tDoc.VersionNumber = tDocInfo.DocVersion
        /// 患者就诊日期起始时间 
        Set tDoc.PatEffectiveLowTime =tDocInfo.EncBeginTime
        /// 患者就诊日期截至时间  
        Set tDoc.PatEffectiveHighTime =tDocInfo.EncEndTime
        /// 文档提供的医院标识
        Set tDoc.ProHosCode =tDocInfo.HospitalID
        /// 文档提供的医院名称
        Set tDoc.ProHosName =tDocInfo.HospitalName
        /// 科室代码
        Set tDoc.DeptCode =tDocInfo.DeptCode
        /// 文档创建者编号
        Set tDoc.DocUserCode =tDocInfo.AuthorID
        /// 文档创建者姓名
        Set tDoc.DocUserName =tDocInfo.AuthorName
        /// 文档保管的医院标识                    
        Set tDoc.RepHosCode =tDocInfo.CustodianCode
        /// 文档保管的医院名称
        Set tDoc.RepHosName =tDocInfo.CustodianName
        
        /// 检查已有当前文档
        Set tSC = ##class(HCC.DocRepository.LatestDocs).UKDocIdExists(tDoc.DocId)
        /// 删除已有当前文档
        Set:(tSC) tSC= ##class(HCC.DocRepository.LatestDocs).UKDocIdDelete(tDoc.DocId)
        
        /// 从历史文档产生当前文档并保存
        Set tLtsDoc = ##class(HCC.Utils.SharedDocTransfer).AllDocToLatestDoc(tDoc)
        Set tSC = tLtsDoc.%Save() 
        /// 保存历史文档
        Set tSC = tDoc.%Save()
        Return:($$$ISERR(tSC)) tSC
        k (tLtsDoc,tDoc)
        Return $$$OK
    }
    Catch(e)
    {
        Return e.AsStatus()
    }
}

/// 禁用数据元约束检查
ClassMethod SkipDEValidation() As %Status
{
    Set $bit(^WS.Setting.Validation,1)=0
    Quit $$$OK
}

/// 启用数据元约束检查
ClassMethod EnforceDEValidation() As %Status
{
    Set $bit(^WS.Setting.Validation,1)=1
    Quit $$$OK
}

/// 设置xsl目录
ClassMethod SetXSLPath(pPath) As %Status
{
    Set ^HCC("XSLFilePath")=pPath
    Quit $$$OK
}

/// 启动Debug模式
ClassMethod EnableDebugMode() As %Status
{
    Set ^HCC("Debug")=1
    Quit $$$OK
}

/// 禁用Debug模式
ClassMethod DisableDebugMode() As %Status
{
    Set ^HCC("Debug")=0
    Quit $$$OK
}

/// 设置Debug模式下输出文档的路径
ClassMethod SetDebugFilePath(pPath) As %Status
{
    Set ^HCC("Debug","SQLDocOutputFolder")=pPath
    Quit $$$OK
}

ClassMethod toUTF8(ByRef tOutput As %GlobalCharacterStream)
{
    Set tLen=3600000, tStreamBuffer="",tTempString=""
    Do tOutput.Rewind()
    While tLen>0
        {
            Set tTempString= tOutput.Read(.tLen,.tSC) 
            Set tTempString= $ZCVT(tTempString,"I","UTF8",handler)
            set tTempString=$REPLACE(tTempString,"&lt;","<")
            set tTempString=$REPLACE(tTempString,"&gt;",">")
            Set tStreamBuffer = tStreamBuffer_tTempString
        }
        Do tOutput.Clear()
        Do tOutput.Write(tStreamBuffer)
}

/// 获取HCC日志
/// pBeginTime: 查询时间范围-开始时间
/// pEndTime: 查询时间范围-结束时间
/// pType: 日志类型
ClassMethod GetHCCLog(pBeginTime = "", pEndTime = "", pType = "") As %String
{
    Set (tTypeClause,tBeginClause,tEndClause)="", tCondCount=0,tRet="",
    tSQL = "SELECT JSON_ARRAYAGG(JSON_OBJECT('Action':Action,'DocNum':DocNum,'LogTime':LogTime,'Msg':Msg,'Type':Type)) As jmsg From HCC.log"
    If $$$ISOK(##class(%TimeStamp).IsValid($replace($ZStrip(pBeginTime, "<>W"),$C(10),"")))
    {
        Set tBeginClause =" LogTime>='" _$replace($ZStrip(pBeginTime, "<>W"),$C(10),"")_"' "
        Do $I(tCondCount)
    }
    If $$$ISOK(##class(%TimeStamp).IsValid($replace($ZStrip(pEndTime, "<>W"),$C(10),"")))
    {
        Set tEndClause = $case(tCondCount,1:" AND",:"" )_" LogTime<='" _$replace($ZStrip(pEndTime, "<>W"),$C(10),"")_"' "
        Do $I(tCondCount)
    }
    If $replace($ZStrip(pType, "<>W"),$C(10),"") '=""
    {
        Set tTypeClause = $case(tCondCount,0:"",:" AND" )_" Type='"_$replace($ZStrip(pType, "<>W"),$C(10),"")_"' "
        Do $I(tCondCount)
    }
    
    If tCondCount>0
    {
        Set tSQL = tSQL _ " WHERE "_tBeginClause_tEndClause_tTypeClause
    }
    Set tSQL = tSQL _ " ORDER BY LogTime"
        
    Set tRS = ##class(%SQL.Statement).%ExecDirect(,tSQL)
    While tRS.%Next()
    {
        Set tRet=tRS.jmsg
    }

    Q tRet
}

ClassMethod ListVS() As %String
{
    If $D(^WS.VSList)=1
    {
        Return $G(^WS.VSList)
    }
    
    Set tRet ="",tJO = ##class(%DynamicObject).%New()
    Set glo="^WS.VS"
    For 
    {
        Set glo=$O(^$G(glo))
        Quit:'(glo["^WS.VS.")
        Set tTMP=$P(glo,".",3)
        If glo["^WS.VS.DE"
        {
            //DE083000800
            Set tJO.name=$E(tTMP,1,4)_"."_$E(tTMP,5,6)_"."_$E(tTMP,7,9)_"."_$E(tTMP,10,11)
        }
        ElseIf glo [ "^WS.VS.CV"
        {
            //WS.VS.CV0600118
            Set tJO.name=$E(tTMP,1,4)_"."_$E(tTMP,5,7)_"."_$E(tTMP,8,9)
        }
        Else
        {
            Set tJO.name=tTMP
        }
        Set tRet = tRet_","_tJO.%ToJSON()
    }
    Set tRet = "["_$E(tRet,2,$L(tRet))_"]"
    Set ^WS.VSList = tRet
    Return tRet
}

ClassMethod Test()
{
    s tXSL="c:\HCC\XSLT\C0001.xsl"
    Set tSC=##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(tXSL,.tCompiledStyleSheet)
    If $$$ISERR(tSC)
    {
        w $System.Status.GetErrorText(%objlasterror)
    }
}

}
