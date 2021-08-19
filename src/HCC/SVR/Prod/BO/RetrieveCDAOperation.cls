/// 
/// Author: Jeff Liu
/// Date: 2021-08-11 13:30:11
/// LastEditTime: 2021-08-17 00:20:08
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: \HCC\SVR\Prod\BO\RetrieveCDAOperation.cls
/// Jeff.liu@intersytems.com
/// 
/// 共享文档调阅BO
Class HCC.SVR.Prod.BO.RetrieveCDAOperation Extends Ens.BusinessOperation
{

/// 调阅xsl
Property DocRetrieveXSL As %String;

Parameter SETTINGS = "DocRetrieveXSL:Basic";

Parameter INVOCATION = "Queue";

/// 共享文档调阅
Method RetrieveCDAOperation(pRequest As HCC.SVR.Prod.MSG.SVRRequest, Output pResponse As HCC.SVR.Prod.MSG.SVRResponse) As %Status
{
      #Dim pDoc as EnsLib.EDI.XML.Document
    #Dim gxwdDoc as HCC.DocRepository.LatestDocs
    #dim DocList as HCC.DocRepository.DocRetrieveModel
    Set pDoc= ##class(EnsLib.EDI.XML.Document).ImportFromLibraryStream(pRequest.Message)
    Set pDoc.DocType=pRequest.DocType_":"_pRequest.DocType
    Set sqlStr="select ID from HCC_DocRepository.LatestDocs where 1=1 "
    // 获得消息发送方ID
    Set SenderID = pDoc.GetValueAt("/RCMR_IN000031UV01/sender[1]/device[1]/id[1]/item[1]/@extension")
    // 获得消息接收方ID
    Set ReceiverID = pDoc.GetValueAt("/RCMR_IN000031UV01/receiver[1]/device[1]/id[1]/item[1]/@extension")
    //获得查询ID
    Set QueryID= pDoc.GetValueAt("/RCMR_IN000031UV01/controlActProcess[1]/queryByParameter[1]/queryId[1]/@extension")
    //获得文档类型
    Set DocType= pDoc.GetValueAt("/RCMR_IN000031UV01/controlActProcess[1]/queryByParameter[1]/clinicalDocument.code[1]/value[1]/@code")
    If DocType '=""
    {
        Set sqlStr=sqlStr_" and DocCode = "_"'"_DocType_"'"
    }

    // 获得 文档ID
    Set DocID = pDoc.GetValueAt("/RCMR_IN000031UV01/controlActProcess[1]/queryByParameter[1]/clinicalDocument.id[1]/value[1]/@extension")
    If DocID '=""
    {
        Set sqlStr=sqlStr_" and DocId = "_"'"_DocID_"'"
    }

    // 获得患者住院号
    Set PatInHosCode =pDoc.GetValueAt("/RCMR_IN000031UV01/controlActProcess[1]/queryByParameter[1]/encompassingEncounter.id[1]/value[1]/item[1]/@extension")
    If PatInHosCode '=""
    {
        Set sqlStr=sqlStr_" and PatInHosCode = "_"'"_PatInHosCode_"'"
    }
    //获得患者门诊号
    Set PatOutHosCode =pDoc.GetValueAt("/RCMR_IN000031UV01/controlActProcess[1]/queryByParameter[1]/encompassingEncounter.id[1]/value[1]/item[2]/@extension")
       If PatOutHosCode '=""
    {
        Set sqlStr=sqlStr_" and PatOutHosCode = "_"'"_PatOutHosCode_"'"
    }

    // 获得患者ID
    Set PatientID = pDoc.GetValueAt("/RCMR_IN000031UV01/controlActProcess[1]/queryByParameter[1]/patient.id[1]/value[1]/item[1]/@extension")
    If PatientID '=""
    {   
        Set Patient = ##class(HCC.DocRepository.Patient).UKPatIdIOpen(PatientID)
        If Patient '=""{
        Set patID=Patient.%Id()
        Set sqlStr=sqlStr_" and Patient = "_"'"_patID_"'"
        }
    }

    // 获得患者身份证号
    Set PatCardID=pDoc.GetValueAt("/RCMR_IN000031UV01/controlActProcess[1]/queryByParameter[1]/patient.id[1]/value[1]/item[2]/@extension")
    If PatCardID '=""
    {   
        Set Patient = ##class(HCC.DocRepository.Patient).UKPatCardIdIOpen(PatCardID)
        If Patient '=""{
        Set patID=Patient.%Id()
        Set sqlStr=sqlStr_" and Patient = "_"'"_patID_"'"
        }
    }

    //获得患者姓名
    Set PatientName =pDoc.GetValueAt("/RCMR_IN000031UV01/controlActProcess[1]/queryByParameter[1]/patient.id[1]/semanticsText[1]/@value")
    $$$LOGINFO(sqlStr)
    Set DocList=##class(HCC.DocRepository.DocRetrieveModel).%New()
    Set tStatement = ##class(%SQL.Statement).%New(1)
   Set qStatus = tStatement.%Prepare(sqlStr)
    If qStatus'=1 {Write "%Prepare failed:" Do $SYSTEM.Status.DisplayError(qStatus) Quit}
    set marker =""
   Set rset = tStatement.%Execute()
   While rset.%Next() {
      Set ID = rset.%Get("ID")
      set marker =ID
      #Dim Doc as HCC.DocRepository.LatestDocs
      Set Doc = ##class(HCC.DocRepository.LatestDocs).%OpenId(ID)
      set DocCopy=Doc.%ConstructClone()
      Set content=DocCopy.Content
      $$$LOGINFO(content)
      s BinaryText=$ZCONVERT(content,"O","UTF8")
      s Base64Encoded=$system.Encryption.Base64Encode(BinaryText)
      set DocCopy.Content=Base64Encoded
      $$$LOGINFO(Doc)
      Do DocList.DocRetrieveResults.Insert(DocCopy)
     }
    $$$LOGINFO(DocList.DocRetrieveResults)
   if (marker="")
   {
       set pResponse=##class(HCC.Utils.ResponseHelper).ReturnErrorMsg(pRequest.MsgId,"调阅文档不存在",SenderID)
       quit $$$OK
   }
   Set DocList.queryId=QueryID
   Set DocList.ResultDetail="调阅成功"
   Set DocList.SenderID=ReceiverID
   Set DocList.ReceiverID=SenderID
   set DocList.TargetMessageID=pRequest.MsgId
   set DocList.ResponseMessageID=##class(%SYSTEM.Util).CreateGUID()
   Set RTime = ##class(Ens.Util.Time).ConvertDateTime($ZDATETIME($ZDATETIMEH($ZTIMESTAMP,-3),3,1,4),"%q(1)","%q(0)",,.tsc)
   Set DocList.ResultResponseTime=RTime
   Set xml =##class(%Stream.GlobalCharacter).%New()
   Do DocList.XMLExportToStream(.xml)
   //Do DocList.XMLExportToString(.string)
   set x = ##class(HS.Util.StreamUtils).EnsureString(xml)
   $$$LOGINFO(x)
   set tsc = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(..DocRetrieveXSL,.xsl)
   
   set xslResult =##class(%Stream.GlobalCharacter).%New()
   set tsc = ##class(%XML.XSLT.Transformer).TransformStreamWithCompiledXSL(xml,xsl,.xslResult)
   do ##class(HCC.Utils.Functions).toUTF8(.xslResult) 
   //set x = ##class(HS.Util.StreamUtils).EnsureString(xslResult)
    //$$$LOGINFO(x)
    set pResponse = ##class(HCC.SVR.Prod.MSG.SVRResponse).%New()
    set pResponse.Message=xslResult
   Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="HCC.SVR.Prod.MSG.SVRRequest">
        <Method>RetrieveCDAOperation</Method>
    </MapItem>
</MapItems>
}

}
