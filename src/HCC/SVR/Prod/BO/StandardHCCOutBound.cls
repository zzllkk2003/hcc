Class HCC.SVR.Prod.BO.StandardHCCOutBound Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method PatRegister(tRequest As HCC.SVR.Prod.MSG.SVRRequest, Output tResponse As HCC.SVR.Prod.MSG.SVRResponse) As %Library.Status
{
 //Set ..Adapter.WebServiceClientClass = "HCC.JHFW.BO.Proxy.JiaoHuServiceSoap"
 //Set tSC = ..Adapter.InvokeMethod("PatRegister",.PatRegisterResult,pRequest.pat)  Quit:$$$ISERR(tSC) tSC
 //Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 //Set pResponse.PatRegisterResult=$get(PatRegisterResult)

 #Dim pRequest as HCC.SVR.Prod.MSG.PatRegisterRequest =##class(HCC.SVR.Prod.MSG.PatRegisterRequest).%New()
 #Dim pResponse as HCC.SVR.Prod.MSG.PatRegisterResponse	=##class(HCC.SVR.Prod.MSG.PatRegisterResponse).%New()
 set tResponse =##class(HCC.SVR.Prod.MSG.SVRResponse).%New()
 set pRequest.pat.Message=##class(HS.Util.StreamUtils).EnsureString(tRequest.Message)
 set pRequest.pat.Action=tRequest.Action
 Set ..Adapter.WebServiceClientClass = "HCC.JHFW.BO.Proxy.JiaoHuServiceSoap"
 Set tSC = ..Adapter.InvokeMethod("PatRegister",.PatRegisterResult,pRequest.pat)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.PatRegisterResult=$get(PatRegisterResult)
 $$$LOGINFO(pResponse.PatRegisterResult)
 set x=pResponse.PatRegisterResult
 //set stream =##class(%Stream.GlobalCharacter).%New()
 do tResponse.Message.Write(x)
 
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="HCC.SVR.Prod.MSG.SVRRequest">
		<Method>PatRegister</Method>
	</MapItem>
</MapItems>
}

}
