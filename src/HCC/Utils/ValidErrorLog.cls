/// /// 保存验证错误信息
Class HCC.Utils.ValidErrorLog Extends (%Persistent, %XML.Adaptor)
{

/// 区分校验文档
Property DocName As %String;

/// 产生校验错误的节点
Property Node As %String(MAXLEN = "");

/// 校验错误信息
Property Msg As %String(MAXLEN = "");

Index IdxDoc On DocName [ Data = Msg ];

Storage Default
{
<Data name="ValidErrorLogDefaultData">
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
<DataLocation>^HCC.Utils.ValidErrorLogD</DataLocation>
<DefaultData>ValidErrorLogDefaultData</DefaultData>
<IdLocation>^HCC.Utils.ValidErrorLogD</IdLocation>
<IndexLocation>^HCC.Utils.ValidErrorLogI</IndexLocation>
<StreamLocation>^HCC.Utils.ValidErrorLogS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
