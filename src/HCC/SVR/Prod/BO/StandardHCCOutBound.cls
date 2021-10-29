/// 
/// Author: Jeff Liu
/// Date: 2021-09-09 13:43:29
/// LastEditTime: 2021-09-14 11:09:41
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/SVR/Prod/BO/StandardHCCOutBound.cls
/// Jeff.liu@intersytems.com
/// 
Class HCC.SVR.Prod.BO.StandardHCCOutBound Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Property SoapAction As %String(MAXLEN = "");

Parameter SETTINGS = "SoapAction:Basic";

Method HIPMessageServer(pRequest As HCC.SVR.Prod.MSG.SVRRequest, Output pResponse As HCC.SVR.Prod.MSG.SVRResponse) As %Library.Status
{
 #Dim tRequest as HCC.SVR.Prod.MSG.HIPMessageServerRequest =##class(HCC.SVR.Prod.MSG.HIPMessageServerRequest).%New()
 #Dim tResponse as HCC.SVR.Prod.MSG.HIPMessageServerResponse =##class(HCC.SVR.Prod.MSG.HIPMessageServerResponse).%New()
 //set soapAction="urn:hl7-org:v3/EMR.WS.PatientService.HIPMessageServer"
 set pResponse =##class(HCC.SVR.Prod.MSG.SVRResponse).%New()
 set tRequest.message=##class(HS.Util.StreamUtils).EnsureString(pRequest.Message)
 set tRequest.action=pRequest.Action
 Set ..Adapter.WebServiceClientClass = "HCC.SVR.Prod.BO.Proxy.StandardHCCOutBound"
 //SoapAction 传入设置
 Set tSC = ..Adapter.InvokeMethod("HIPMessageServer",.HIPMessageServerResult,tRequest.action,tRequest.message,..SoapAction)  Quit:$$$ISERR(tSC) tSC
 Set tSC = tRequest.NewResponse(.tResponse)  Quit:$$$ISERR(tSC) tSC
 Set tResponse.HIPMessageServerResult=$get(HIPMessageServerResult)
 set x=tResponse.HIPMessageServerResult
 do pResponse.Message.Write(x)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="HCC.SVR.Prod.MSG.SVRRequest">
		<Method>HIPMessageServer</Method>
	</MapItem>
</MapItems>
}

}
