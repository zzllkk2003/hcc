/// 数据值范围
Class HCC.SQL.Term.Range Extends (%Persistent, %XML.Adaptor) [ Language = objectscript ]
{

/// 值域代码
Property DataValueCode As %String;

/// 值域名称
Property DataValueName As %String;

/// 值
Property Value As %String;

/// 值含义
Property Description As %String;

/// 类别
Property DTType As %String;

/// 说明
Property Comment As %String;

Storage Default
{
<Data name="RangeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DataValueCode</Value>
</Value>
<Value name="3">
<Value>DataValueName</Value>
</Value>
<Value name="4">
<Value>Value</Value>
</Value>
<Value name="5">
<Value>Description</Value>
</Value>
<Value name="6">
<Value>DTType</Value>
</Value>
<Value name="7">
<Value>Comment</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Term.RangeD</DataLocation>
<DefaultData>RangeDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Term.RangeD</IdLocation>
<IndexLocation>^HCC.SQL.Term.RangeI</IndexLocation>
<StreamLocation>^HCC.SQL.Term.RangeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
