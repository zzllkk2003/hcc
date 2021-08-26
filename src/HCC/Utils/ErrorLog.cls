/// /// 保存验证错误信息
Class HCC.Utils.ErrorLog Extends (%Persistent, %XML.Adaptor)
{

/// 区分校验文档
Property DocName As %String;

/// 产生校验错误的节点
Property Node As %String(MAXLEN = "");

/// 校验错误信息
Property Msg As %String(MAXLEN = "");

Storage Default
{
<Data name="ErrorLogDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DocName</Value>
</Value>
<Value name="3">
<Value>Node</Value>
</Value>
<Value name="4">
<Value>Msg</Value>
</Value>
</Data>
<DataLocation>^HCC.Utils.ErrorLogD</DataLocation>
<DefaultData>ErrorLogDefaultData</DefaultData>
<IdLocation>^HCC.Utils.ErrorLogD</IdLocation>
<IndexLocation>^HCC.Utils.ErrorLogI</IndexLocation>
<StreamLocation>^HCC.Utils.ErrorLogS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
