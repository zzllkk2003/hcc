Class TRIP.JHFW.BO.TestService Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Method HIPMessageServer(pRequest As TRIP.JHFW.Message.JiaoHuMsgRequest, Output pResponse As TRIP.JHFW.Message.JiaoHuMsgResponse) As %Library.Status
{
    set ..Adapter.FilePath="C:\HCC\output"
    set st=..Adapter.PutLine("service.log",pRequest.Message.Read())
    
    Set pResponse = ##class(TRIP.JHFW.Message.JiaoHuMsgResponse).%New()  
    Set pResponse.Result=1
    Do pResponse.Message.Write("OK")
 
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="TRIP.JHFW.Message.JiaoHuMsgRequest">
        <Method>HIPMessageServer</Method>
    </MapItem>
</MapItems>
}

}
