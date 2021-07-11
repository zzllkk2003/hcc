/// Description
Class TRIP.JHFW.BO.CDAOperation Extends Ens.BusinessOperation
{

// Property Adapter As Ens.OutboundAdapter;

// Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method CDAOperation(pRequest As TRIP.JHFW.Message.JiaoHuMsgRequest, Output pResponse As TRIP.JHFW.Message.JiaoHuMsgResponse) As %Status
{
    #Dim pDoc as EnsLib.EDI.XML.Document
    #Dim Patient as HCC.Patient
    set pDoc= ##class(EnsLib.EDI.XML.Document).ImportFromLibraryStream(pRequest.Message)
    set pDoc.DocType=pRequest.DocType_":"_pRequest.DocType  
    set tsc =""
    //获得文档BASE64字符串
    set DocBase64 = pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).storageCode.originalText.value") 
    //获得文档版本
    set DocVersion = pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).versionNumber.value")
    $$$LOGINFO(DocBase64_"--------"_DocVersion)
     //Base64 解码
    set DocContent= ##class(%SYSTEM.Encryption).Base64Decode(DocBase64)
    
    $$$LOGINFO(DocContent)
    //解码后转Encoding
    set DocContent= $ZCONVERT(DocContent,"I","UTF8")
    $$$LOGINFO(DocContent)
    
    //获取病人id 目前是身份证号进行验证
    set PatientNo =pDoc.GetValueAt( "controlActProcess(1).subject(1).clinicalDocument(1).recordTarget(1).patient(1).choice.patientPerson(1).id.item(1).extension") 
    //获取文档类型
    set CDADocType= pDoc.GetValueAt("controlActProcess(1).subject(1).clinicalDocument(1).code(1).code") 
     
    //TODO:获取流水号 暂时没用上
    //set DOCId = pDoc.GetValueAt(controlActProcess(1).subject(1).clinicalDocument(1).id(1).extension)

    do $CASE(pRequest.Action,"DocumentRegister":DocReg(PatientNo,CDADocType,DocContent,DocVersion),:Null())
    //set tsc= ##class(HCC.DocRepository).RegisterDoc(PatientNo,CDADocType,DocContent)

    set pResponse = ##class(TRIP.JHFW.Message.JiaoHuMsgResponse).%New()
    if $$$ISERR(tsc)
    {
    do pResponse.Message.Write("整错了"_$zts)
    
    set pResponse.Result=0
    quit $$$OK
    }
    set ts=$zts
    $$$LOGINFO(ts)
    do pResponse.Message.Write("整好了"_ts)
    
    set pResponse.Result=1

    quit $$$OK

DocReg(PatientNo,CDADocType,DocContent,DocVersion)
 
 set tsc = ##class(HCC.DocRepository).RegisterDoc(PatientNo,CDADocType,DocContent,DocVersion) 
 return 
Null()
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="TRIP.JHFW.Message.JiaoHuMsgRequest">
        <Method>CDAOperation</Method>
    </MapItem>
</MapItems>
}

}
