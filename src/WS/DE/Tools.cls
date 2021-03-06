/// Author: QP
/// Version: 1.0
/// Date: 2021/06/11
/// 数据元方法
Class WS.DE.Tools Extends %RegisteredObject
{

/// 按数据元验证值是否符合约束
/// w ##class(WS.DE.Tools).Validate("DE02.01.031.00","1000",.msg)
ClassMethod Validate(pDEType = "DE04.50.001.00", pValue = "1", Output pErrMsg) As %Boolean
{
        /*
        S x=##class(WS.DE.DE020103100).%New()
        s x.Value = "99"
        w x.%ValidateObject()*/
        Set tClass = "WS.DE."_$Replace(pDEType,".","")
        Set tObj = $ClassMethod(tClass,"%New")
        Set tObj.Value = pValue
        Set tSC = tObj.%ValidateObject()
        Do tObj.%Close()
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

/// 检查值是否符合值集
/// 输入参数: 
/// pValue: 检查的值
/// pVSName: 值集名称(例如：CV02.01.101、DE09.00.103.00)
/// 返回参数: 布尔类型。在值集内，返回1；否则返回0
ClassMethod ValideValueSet(pValue, pVSName) As %Boolean
{
    Set tRet= 0
    Set tGlobalName = "^WS.VS."_$Replace(pVSName,".","")
    Set tRet = $D(@tGlobalName(@pValue))
    Return tRet
}

/// 检查值是否符合数据元值集约束.
/// 如果数据元没有值集约束，直接返回1;
/// 如果数据元有值集约束，且值在值集内,返回1;否则返回0.
/// 输入参数: 
/// pValue: 检查的值
/// pDE: 数据元名称(例如：DE09.00.103.00)
/// 返回参数: 布尔类型
ClassMethod ValidateDEValue(pValue, pDE) As %Boolean
{
    Set tVS="",tDEVSParamID="WS.DE."_$Replace(pDE,".","")_"||ValueSet"
    &SQL(select _Default into :tVS from %Dictionary.CompiledParameter where id1=:tDEVSParamID)
    Return:(tVS="") 1
    
    Return ..ValideValueSet(pValue,tVS)
}

/// 通过卫生数据元类型获得对应的XSI的类型
ClassMethod GetXSIDataType(pWSDT) As %String
{
    Quit $Case(pWSDT,"S1":"ST","L":"BL","S3":"CD","N":"PQ","":"","":"","":"","":"","":"","":"","":"")
}

/// parse the datatype string (pDTStr) of WS data element, like A..100
/// into ISC data type (pDataType) and data range (pMin, pMax)
ClassMethod GetDTDetails(pDTStr As %String = "N3..4,3", Output pDataType As %String, Output pMin As %Integer, Output pMax As %Integer, Output pScale As %Integer) As %Status
{
    Set tRet = $$$ERROR($$$GeneralError,"Not Matching")
    set pDataType="",(pMin,pMax)=0
    //set tRegex=##class(%Regex.Matcher).%New("(AN|DT|N|D|T|A){1}([0-9]){0,3}(\.\.){0,1}([0-9]){0,3}")
    //set tRegex=##class(%Regex.Matcher).%New("((AN|DT|N|D|T|A){1})(\d{0,3})((\.\.){0,1})(\d{0,3})")
    //set tRegex=##class(%Regex.Matcher).%New("(AN|DT|N|D|T|A){1}(\d{0,3})(\.\.){0,1}(\d{0,3}),{0,1}([0-9])")
    Set tRegex=##class(%Regex.Matcher).%New("(AN|DT|N|D|T|A){1}(\d{0,4})(,(\d)){0,1}(\.\.(\d{0,4})(,(\d)){0,1}){0,1}")

    Set tRegex.Text=pDTStr
    while tRegex.Locate() 
    {
        Set pDataType=tRegex.SubstituteIn("$1")
        Set pMin=+tRegex.SubstituteIn("$2")
        Set pScale=+tRegex.SubstituteIn("$4")
        Set pMax=+tRegex.SubstituteIn("$6")
        Set:(pMax=0) pMax= pMin
        Set:(pScale=0) pScale=+tRegex.SubstituteIn("$8")
        Set tRet = $$$OK
    }
    Return tRet
}

}
