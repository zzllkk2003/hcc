/// 共享文档检索BO
Class HCC.SVR.Prod.BO.SearchCDAOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method SearchOperation(pRequest As HCC.SVR.Prod.MSG.SVRRequest, Output pResponse As HCC.SVR.Prod.MSG.SVRResponse) As %Status
{
    
    #Dim pDoc as EnsLib.EDI.XML.Document
    #Dim gxwdDoc as HCC.DocRepository.LatestDocs
    #Dim DocRetrieve as HCC.DocRepository.DocRetrieveModel
    set pDoc= ##class(EnsLib.EDI.XML.Document).ImportFromLibraryStream(pRequest.Message)
    set pDoc.DocType=pRequest.DocType_":"_pRequest.DocType
    //获得检索请求时间起始
    set DocRegTimeLow =""
    //获取检索请求时间结束
    set DocRegTimeHigh =""
}

/// 组合检索返回消息
ClassMethod ReturnSearchResult() As HCC.SVR.Prod.MSG.SVRResponse
{
    Set sc = $$$OK
    // do something
    Return sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="HCC.SVR.Prod.MSG.SVRRequest">
        <Method>SearchOperation</Method>
    </MapItem>
</MapItems>
}

}
