Class TRIP.JHFW.BO.TRIPServiceSoap Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method HIPMessageServer(pRequest As TRIP.JHFW.Message.HIPMessageServerRequest, Output pResponse As TRIP.JHFW.Message.HIPMessageServerResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "TRIP.JHFW.Proxy.TRIPServiceSoap"
 Set tSC = ..Adapter.InvokeMethod("HIPMessageServer",.HIPMessageServerResult,pRequest.action,pRequest.message)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.HIPMessageServerResult=$get(HIPMessageServerResult)
 
 set HIPMessageServerResultStream = ##class(%Stream.GlobalCharacter).%New()
 
 do HIPMessageServerResultStream.Write(pResponse.HIPMessageServerResult)
 
 set pResponse.HIPMessageServerResultStream=HIPMessageServerResultStream
 
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="TRIP.JHFW.Message.HIPMessageServerRequest">
		<Method>HIPMessageServer</Method>
	</MapItem>
</MapItems>
}

}
