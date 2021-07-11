/// 共享文档检索BO
Class TRIP.GXWD.BO.SearchOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method SearchOperation(pRequest As TRIP.JHFW.Message.JiaoHuMsgRequest, Output pResponse As TRIP.JHFW.Message.JiaoHuMsgResponse) As %Status
{
    
    #Dim pDoc as EnsLib.EDI.XML.Document
    #Dim gxwdDoc as TRIP.GXWD.MODEL.GXWDDOC
    #Dim DocRetrieve as TRIP.GXWD.MODEL.DocRetrieveModel
    set pDoc= ##class(EnsLib.EDI.XML.Document).ImportFromLibraryStream(pRequest.Message)
    set pDoc.DocType=pRequest.DocType_":"_pRequest.DocType
    //获得检索请求时间起始
    set DocRegTimeLow =""
    //获取检索请求时间结束
    set DocRegTimeHigh =""
}

/// 组合检索返回消息
ClassMethod ReturnSearchResult() As TRIP.JHFW.Message.JiaoHuMsgResponse
{
    Set sc = $$$OK
    // do something
    Return sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="TRIP.JHFW.Message.JiaoHuMsgRequest">
        <Method>SearchOperation</Method>
    </MapItem>
</MapItems>
}

}
