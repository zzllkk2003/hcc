/// 
/// Author: Jeff Liu
/// Date: 2021-08-13 13:19:58
/// LastEditTime: 2021-08-17 00:12:02
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: \HCC\SVR\Prod\BO\AccessCDAOperation.cls
/// Jeff.liu@intersytems.com
/// 
Class HCC.SVR.Prod.BO.AccessCDAOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method AccessCDAOperation(pRequest As HCC.SVR.Prod.MSG.SVRRequest, Output pResponse As HCC.SVR.Prod.MSG.SVRResponse) As %Status
{
    
    #Dim pDoc as EnsLib.EDI.XML.Document
    #Dim gxwdDoc as HCC.DocRepository.LatestDocs
    #dim DocList as HCC.DocRepository.DocRetrieveModel
    set pDoc= ##class(EnsLib.EDI.XML.Document).ImportFromLibraryStream(pRequest.Message)
    set pDoc.DocType=pRequest.DocType_":"_pRequest.DocType
    set sqlStr="select ID from HCC_DocRepository.LatestDocs where 1=1 "
    // 获得消息发送方ID
    set SenderID = pDoc.GetValueAt("/RCMR_IN000029UV01/sender[1]/device[1]/id[1]/item[1]/@extension")
    // 获得消息接收方ID
    set ReceiverID = pDoc.GetValueAt("/RCMR_IN000029UV01/receiver[1]/device[1]/id[1]/item[1]/@extension")
    //获得查询ID
    set QueryID= pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/queryId[1]/@extension")
      $$$LOGINFO(QueryID)
    //获得检索注册时间起始
    set DocRegTimeStart =pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/executionAndDeliveryTime[1]/@validTimeLow")
    if DocRegTimeStart =""
    {set DocRegTimeStart ="19000101"}
        set DocRegTimeStart = ##class(Ens.Util.Time).ConvertDateTime(DocRegTimeStart,"%Y%m%d","%q(1)",,.tsc) 
        set sqlStr=sqlStr_" and AddDate between "_"'"_DocRegTimeStart_"'"
    $$$LOGINFO(DocRegTimeStart)

    //获取检索注册时间结束
    set DocRegTimeEnd =pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/executionAndDeliveryTime[1]/@validTimeHigh")
    if DocRegTimeEnd =""
    {set DocRegTimeEnd ="29000101"}
    set DocRegTimeEnd = ##class(Ens.Util.Time).ConvertDateTime(DocRegTimeEnd,"%Y%m%d","%q(1)",,.tsc)
    set sqlStr=sqlStr_" and "_"'"_DocRegTimeEnd_"'"
    $$$LOGINFO(DocRegTimeEnd)

    // 获取文档创建者检索
    set DocRegisterCode=pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/assignedAuthor.id[1]/value[1]/@extension")
    if DocRegisterCode '=""
    {
        set sqlStr=sqlStr_" and DocUserCode ="_"'"_DocRegisterCode_"'"
    }
    $$$LOGINFO(DocRegisterCode)

    // 获得检索文档类型
    set DocType=pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/clinicalDocument.code[1]/value[1]/@code")
    if DocType '=""
    {
        set sqlStr=sqlStr_" and DocCode = "_"'"_DocType_"'"
    }
    $$$LOGINFO(DocType)

    // 获取文档生成日期起始
    set DocGenerateTimeStart=pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/clinicalDocument.effectiveTime[1]/value[1]/low[1]/@value")
    if DocGenerateTimeStart =""
    {set DocGenerateTimeStart ="19000101"}
    set DocGenerateTimeStart = ##class(Ens.Util.Time).ConvertDateTime(DocGenerateTimeStart,"%Y%m%d","%q(1)",,.tsc) 
        set sqlStr=sqlStr_" and DocCreatTime between "_"'"_DocGenerateTimeStart_"'"
    $$$LOGINFO(DocGenerateTimeStart)

    // 获取文档生成日期结束
    set DocGenerateTimeEnd=pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/clinicalDocument.effectiveTime[1]/value[1]/high[1]/@value")
    if DocGenerateTimeEnd =""
    {set DocGenerateTimeEnd ="29000101"}
        set DocGenerateTimeEnd = ##class(Ens.Util.Time).ConvertDateTime(DocGenerateTimeEnd,"%Y%m%d","%q(1)",,.tsc)
    set sqlStr=sqlStr_" and "_"'"_DocGenerateTimeEnd_"'"
    $$$LOGINFO(DocGenerateTimeEnd)

    // 获取患者就诊日期起始
    set PaitentEncounterTimeStart=pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/encompassingEncounter.effectiveTime[1]/value[1]/low[1]/@value")
    if PaitentEncounterTimeStart =""
    {set PaitentEncounterTimeStart ="19000101"}
    set PaitentEncounterTimeStart = ##class(Ens.Util.Time).ConvertDateTime(PaitentEncounterTimeStart,"%Y%m%d","%q(1)",,.tsc) 
        set sqlStr=sqlStr_" and PatEffectiveLowTime between "_"'"_PaitentEncounterTimeStart_"'"
    $$$LOGINFO(PaitentEncounterTimeStart)

    // 获取患者就诊日期结束
    set PatientEncounterTImeEnd=pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/encompassingEncounter.effectiveTime[1]/value[1]/high[1]/@value")
     if PatientEncounterTImeEnd =""
    {set PatientEncounterTImeEnd ="29000101"}
    set PatientEncounterTImeEnd = ##class(Ens.Util.Time).ConvertDateTime(PatientEncounterTImeEnd,"%Y%m%d","%q(1)",,.tsc)
    set sqlStr=sqlStr_" and "_"'"_PatientEncounterTImeEnd_"'"
    $$$LOGINFO(PatientEncounterTImeEnd)

    // 获取患者就诊门诊号
    set PatientOutpatientEncounterNumber=pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/encompassingEncounter.id[1]/value[1]/item[2]/@extension")
    if PatientOutpatientEncounterNumber '=""
    {
        set sqlStr=sqlStr_" and PatOutHosCode = "_"'"_PatientOutpatientEncounterNumber_"'"
    }
    $$$LOGINFO(PatientOutpatientEncounterNumber)

    //获取患者就诊住院号
    set PatientInpatientEncounterNumber =pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/encompassingEncounter.id[1]/value[1]/item[1]/@extension")
     if PatientInpatientEncounterNumber '=""
    {
        set sqlStr=sqlStr_" and PatInHosCode = "_"'"_PatientInpatientEncounterNumber_"'"
    }
    $$$LOGINFO(PatientInpatientEncounterNumber)

    // 获取患者身份证号
    set PatientSSNID=pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/patient.id[1]/value[1]/item[2]/@extension")
      if PatientSSNID '=""
    {   
        set Patient = ##class(HCC.DocRepository.Patient).UKPatCardIdIOpen(PatientSSNID)
        if Patient '=""{
        set patID=Patient.%Id()
        set sqlStr=sqlStr_" and Patient = "_"'"_patID_"'"
        }
    }
    $$$LOGINFO(PatientSSNID)
    
    // 获取患者id
    set PatientID=pDoc.GetValueAt("/RCMR_IN000029UV01/controlActProcess[1]/queryByParameter[1]/patient.id[1]/value[1]/item[1]/@extension")
        if PatientID '=""
    {   
        set Patient = ##class(HCC.DocRepository.Patient).UKPatIdIOpen(PatientID)
        if Patient '=""{
        set patID=Patient.%Id()
        set sqlStr=sqlStr_" and Patient = "_"'"_patID_"'"
        }
    }
    $$$LOGINFO(PatientID)
    //检索结果数量计数
    set DocQuantity =""

    $$$LOGINFO(sqlStr)
    //组合查询sql
    
    set DocList=##class(HCC.DocRepository.DocRetrieveModel).%New()
    SET tStatement = ##class(%SQL.Statement).%New(1)
   SET qStatus = tStatement.%Prepare(sqlStr)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
   SET rset = tStatement.%Execute()
   WHILE rset.%Next() {
      set ID = rset.%Get("ID")
      #Dim Doc as HCC.DocRepository.LatestDocs
      set Doc = ##class(HCC.DocRepository.LatestDocs).%OpenId(ID)
      $$$LOGINFO(Doc)
      do DocList.DocRetrieveResults.Insert(Doc)
     }

   set DocList.ResultQuantity = rset.%ROWCOUNT
   set DocList.queryId=QueryID
   set DocList.ResultDetail="检索成功"
   set DocList.SenderID=ReceiverID
   set DocList.ReceiverID=SenderID
   set DocList.TargetMessageID=pRequest.MsgId
   set DocList.ResponseMessageID=##class(%SYSTEM.Util).CreateGUID()
   set RTime = ##class(Ens.Util.Time).ConvertDateTime($ZDATETIME($ZDATETIMEH($ZTIMESTAMP,-3),3,1,4),"%q(1)","%q(0)",,.tsc)
   set DocList.ResultResponseTime=RTime
   set xml =##class(%Stream.GlobalCharacter).%New()
   do DocList.XMLExportToStream(.xml)
   do DocList.XMLExportToString(.string)
   //set string = $ZCONVERT(string,"I","UTF8")
   $$$LOGINFO(string)
   #dim xsl as %XML.XSLT.CompiledStyleSheet 
   set tsc = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile("/home/UCRT/xsl/DocumentAccess.xsl",.xsl)
   
   set xslResult =##class(%Stream.GlobalCharacter).%New()
   set tsc = ##class(%XML.XSLT.Transformer).TransformStreamWithCompiledXSL(xml,xsl,.xslResult)
   do ##class(HCC.Utils.Functions).toUTF8(.xslResult) 
   //set x = ##class(HS.Util.StreamUtils).EnsureString(xslResult)
    //$$$LOGINFO(x)
    set pResponse = ##class(HCC.SVR.Prod.MSG.SVRResponse).%New()
    set pResponse.Message=xslResult
    quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="HCC.SVR.Prod.MSG.SVRRequest">
        <Method>AccessCDAOperation</Method>
    </MapItem>
</MapItems>
}

}
