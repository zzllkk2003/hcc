Class HIP.DataGov.Code Extends %Persistent
{

Property Code As %String;

Property Display As %String;

ClassMethod Init()
{
    Set tCode = "5001,7201,7204,5659"
    Set tDisp = "值集匹配错误,长度约束错误,范围约束错误,必要值缺失"
    For i=1:1:$L(tCode,",")
    {
        Set tObj = ..%New()
        Set tObj.Code = $P(tCode,",",i)
        Set tObj.Display = $P(tDisp,",",i)
        Do tObj.%Save()
    }
}

ClassMethod GetDisplay(pCode) As %String
{
    Set tRet = pCode
    &SQL(select display into :tRet from HIP_DataGov.Code where code =:pCode)
    Set:(SQLCODE=100) tRet = pCode 
    Return tRet
}

Storage Default
{
<Data name="CodeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Code</Value>
</Value>
<Value name="3">
<Value>Display</Value>
</Value>
</Data>
<DataLocation>^HIP.DataGov.CodeD</DataLocation>
<DefaultData>CodeDefaultData</DefaultData>
<IdLocation>^HIP.DataGov.CodeD</IdLocation>
<IndexLocation>^HIP.DataGov.CodeI</IndexLocation>
<StreamLocation>^HIP.DataGov.CodeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
