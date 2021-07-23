/// 数据元方法
Class WS.DE.Tools Extends %RegisteredObject
{

/// 按数据元验证值是否符合约束
/// w ##class(WS.DE.Tools).Validate("DE02.01.031.00","1000",.msg)
ClassMethod Validate(pDEType, pValue, Output pErrMsg) As %Boolean
{
        /*
        S x=##class(WS.DE.DE020103100).%New()
        s x.Value = "99"
        w x.%ValidateObject()*/
        Set tClass = "WS.DE."_$Replace(pDEType,".","")
        Set tObj = $ClassMethod(tClass,"%New")
        Set tObj.Value = pValue
        Set tSC = tObj.%ValidateObject()
        Set pErrMsg= $$getAllErrorTexts^EnsUtil(tSC)
        Quit $$$ISOK(tSC)
}

/// 通过数据元名称获得数据元描述
/// w ##class(WS.DE.Tools).GetDataElementDesc("WS.DE.DE045004100")
ClassMethod GetDataElementDesc(pType) As %String
{
    Return $PARAMETER(pType,"Description")
}

/// 通过数据元名称(其实是数据元类名)和数据元的值，获得该值的值集描述
/// w ##class(WS.DE.Tools).GetValueSetDisplay("WS.DE.DE045004100",1)
ClassMethod GetValueSetDisplay(pType, pValue) As %String
{
    Quit:(pValue="") pValue
    Set tRet=pValue
    Set tValueSet = $PARAMETER(pType,"ValueSet")
    If tValueSet '=""
    {
        Set tGlobal="^WS.VS."_$replace(tValueSet,".","")
        Set tRet = $G(@tGlobal@(pValue))
    }
    Quit tRet
}

}
