/// 
/// Author: Jeff Liu
/// Date: 2021-07-13 15:14:20
/// LastEditTime: 2021-07-13 17:42:26
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/SVR/Prod/BO/SaveCDAOperation.cls
/// Jeff.liu@intersytems.com
/// 
/// 对共享文档进行解析和操作（存储、更新等）
Class HCC.SVR.Prod.BO.SaveCDAOperation Extends Ens.BusinessOperation [ Language = objectscript ]
{

/// 文档结构验证设置
Property DocSchemaValidate As %Boolean [ InitialExpression = 0 ];

/// 文档值集验证设置
Property DocValueSetValidate As %Boolean [ InitialExpression = 0 ];

Parameter SETTINGS = "DocSchemaValidate:Basic,DocValueSetValidate:Basic";

Parameter INVOCATION = "Queue";

Method GetDocForSave(pRequest As HCC.SVR.Prod.MSG.SVRRequest, Output pResponse As HCC.SVR.Prod.MSG.SVRResponse) As %Status
{
    try {
        #Dim pDoc as EnsLib.EDI.XML.Document
        #Dim gxwdDoc as HCC.DocRepository.LatestDocs
        //HANG 5
        set pDoc= ##class(EnsLib.EDI.XML.Document).ImportFromLibraryStream(pRequest.Message)
        set pDoc.DocType=pRequest.DocType_":"_pRequest.DocType
        set ValueVResult =""
        set SchemaVResult =""
        set ValueErr =""
        set SchemaErr =""
        set gxwdDoc=##class(HCC.DocRepository.LatestDocs).%New()
        
        /// 身份证号
        Set PatCardId =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).choice.patientPerson(1).id.item(1).extension")

        set gxwdDoc.Patient= ##class(HCC.DocRepository.Patient).UKPatCardIdIOpen(PatCardId)
        
        /// 若病人不存在 注册至病人表
        If (gxwdDoc.Patient="")
        {
         #dim Patient as HCC.DocRepository.Patient = ##class(HCC.DocRepository.Patient).%New()
         /// 患者唯一标识
         Set Patient.PatId =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).id.item(1).extension")
        }

        
        
        /// 住院号标识
        Set gxwdDoc.PatInHosCode =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).id.item(2).extension")

        /// 门诊号标识
        Set gxwdDoc.PatOutHosCode =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).id.item(3).extension")

        /// 患者姓名
        Set gxwdDoc.PatName =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).choice.patientPerson(1).name(1).item(1).part(1).value")


        /// 文档类型代码
        Set DocCode =pDoc.GetValueAt("/RCMR_IN000002UV02/controlActProcess[1]/subject[1]/clinicalDocument[1]/code[1]/@code")

        //获得文档BASE64字符串
        set DocBase64 = pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).storageCode.originalText.value") 

        //Base64 解码
        set DocContent= ##class(%SYSTEM.Encryption).Base64Decode(DocBase64)

        /// 文档原始内容
        Set DocContent = $ZCONVERT(DocContent,"I","UTF8")
        
        $$$LOGINFO("验证设置"_..DocSchemaValidate_"  "_..DocValueSetValidate)
        // 验证文档是否符合值域规则
        
        if (..DocValueSetValidate =1)
        {   
           set ValueVResult= ##class(HCC.Utils.XMLValid).Valid(##class(HS.Util.StreamUtils).EnsureStream(DocContent),DocCode,.ValueErr)
           
        }
        // 验证文档是否符合schema 规则
        if (..DocSchemaValidate =1)
        {
            set SchemaVResult = ##class(HCC.Utils.SchemaValidate).Validate(##class(HS.Util.StreamUtils).EnsureStream(DocContent),.SchemaErr)
        }

        if (ValueVResult=0)&&(SchemaVResult=1)
        {
            set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"文档结构验证成功，文档值域验证失败："_$char(10)_ValueErr)
            quit
        }
        if (ValueVResult=1)&&(SchemaVResult=0)
        {
            set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"文档值域验证成功，文档结构验证失败："_$char(10)_SchemaErr)
            quit
        }
        if (ValueVResult=0)&&(SchemaVResult=0)
        {
            set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"文档值域验证失败："_ValueErr_$char(10)_ "文档结构验证失败："_SchemaErr)
            quit
        }
        set gxwdDoc.Content=DocContent
        set gxwdDoc.DocCode=DocCode
        /// 消息创建时间
        set msgCreatTime=pDoc.GetValueAt("creationTime(1).value")
        Set gxwdDoc.MsgCreatTime = ##class(Ens.Util.Time).ConvertDateTime(msgCreatTime,"%Y%m%d%H%M%S","%q(1)",,.tsc)

        /// 发送系统标识
        Set gxwdDoc.SenderId =pDoc.GetValueAt("sender(1).device(1).id.item(1).extension")

        /// 文档流水号 文档唯一标识
        Set gxwdDoc.DocId =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).id.item(1).extension")

        

        /// 文档类型名称
        Set gxwdDoc.DocName =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).code(1).displayName.value")

        /// 文档生成日期时间
        Set docCreatTime =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).effectiveTime.value")
        Set gxwdDoc.DocCreatTime=##class(Ens.Util.Time).ConvertDateTime(docCreatTime,"%Y%m%d","%q(1)",,.tsc)

        /// 文档版本号
        set vnStr=pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).versionNumber.value")
        Set gxwdDoc.VersionNumber = ##class(%Integer).DisplayToLogical(vnStr)
    

        /// 患者就诊日期起始时间 20170101
        set pelt=pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).effectiveTime.low.value")
        Set gxwdDoc.PatEffectiveLowTime =##class(Ens.Util.Time).ConvertDateTime(pelt,"%Y%m%d","%q(1)",,.tsc)
        
        /// 患者就诊日期截至时间  
        set peht=pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).effectiveTime.high.value")
        Set gxwdDoc.PatEffectiveHighTime =##class(Ens.Util.Time).ConvertDateTime(peht,"%Y%m%d","%q(1)",,.tsc)


        /// 文档提供的医院标识
        Set gxwdDoc.ProHosCode =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.id(1).item(1).extension")

        /// 文档提供的医院名称
        Set gxwdDoc.ProHosName =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.name.item(1).part(1).value")

        /// 科室代码
        Set gxwdDoc.DeptCode =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.organizationContains(1).id.item(1).extension")

        /// 文档创建者编号
        Set gxwdDoc.DocUserCode =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).author(1).assignedAuthor(1).id.item(1).extension")

        /// 文档创建者姓名
        Set gxwdDoc.DocUserName =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).author(1).assignedAuthor(1).choice.assignedPerson.name.item(1).part(1).value")

        /// 文档保管的医院标识                    
        Set gxwdDoc.RepHosCode =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).custodian(1).assignedCustodian(1).representedOrganization(1).id(1).item(1).extension")

        /// 文档保管的医院名称
        Set gxwdDoc.RepHosName =pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).custodian(1).assignedCustodian(1).representedOrganization(1).name.item(1).part(1).value")

        /// 文档保存的服务器时间
        Set gxwdDoc.AddDate =$ZDATETIME($ZDATETIMEH($ZTS,-3),3,1,4)
        
         //【1】首先把数据存储到总表中
        set gxwdDocT=##class(HCC.Utils.SharedDocTransfer).LatestDocToAllDoc(gxwdDoc)
        set tscT =gxwdDocT.%Save()
        if ('tscT){//保存失败
            set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"将共享文档存储到总表中失败。")
            quit
        }
        //【2】组合查询条件，查询主表中是否已经存在该文档，如果已经存在，我们需要删除。
        if (gxwdDoc.PatInHosCode'=""){//判断住院号是否存在
            set whereStr=" AND PatInHosCode=?"
            set val=gxwdDoc.PatInHosCode
        }
        elseif (gxwdDoc.PatOutHosCode'=""){//判断门诊号是否存在
            set whereStr=" AND PatOutHosCode=?"
            set val=gxwdDoc.PatOutHosCode
        }
        else{//住院号和门诊号均不存在的时候，需要第三方传递该信息
            set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"住院号和门诊号必须要传递其中一个。")
            quit
        }
        Set sqlStr = "select ID from TRIP_GXWD_MODEL.GXWD_DOC where DocCode=? AND PatEffectiveLowTime=?"_whereStr
        Set tStatement = ##class(%SQL.Statement).%New()
        Set qStatus = tStatement.%Prepare(sqlStr)
        If qStatus'=1 {
            set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"查找文档是否存在时，组合SQL语句失败。")
            quit
        }
        Set rset = tStatement.%Execute(gxwdDoc.DocCode,gxwdDoc.PatEffectiveLowTime,val)
        While (rset.%Next()) {
            //【3】读取到主表中已经有数据了
            Set RowID = rset.%Get("ID")
            set tscDel=##class(HCC.DocRepository.LatestDocs).%DeleteId(RowID)
            if ('tscDel){
                set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"删除主表中已经存在的共享文档失败。")
                quit
            }
        }
        //【4】将共享文档存储到主表中
        set tsc =gxwdDoc.%Save()
        if (tsc){
            set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnSuccessMsgNoContentAndSenderInfo(pRequest.MsgId)
        } else{
            set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"保存共享文档失败。")
        }
        
 }

  catch exp{

  set pResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(pRequest.MsgId,"解析共享文档消息失败。"_exp.Code_exp.Data_exp.Name_exp.Location)
 }
 quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="HCC.SVR.Prod.MSG.SVRRequest">
        <Method>GetDocForSave</Method>
    </MapItem>
</MapItems>
}

}
