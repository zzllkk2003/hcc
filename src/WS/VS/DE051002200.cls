/// 发育程度代码表
Class WS.VS.DE051002200 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.53";

Storage Default
{
<Data name="DE051002200DefaultData">
<Attribute>Display</Attribute>
<Structure>node</Structure>
<Value name="1">
<Value>Display</Value>
</Value>
</Data>
<Data name="descr">
<Attribute>Description</Attribute>
<Subscript>"Descr"</Subscript>
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Description</Value>
</Value>
</Data>
<DataLocation>^WS.VS.DE051002200</DataLocation>
<DefaultData>DE051002200DefaultData</DefaultData>
<IdLocation>^WS.VS.DE051002200</IdLocation>
<IndexLocation>^WS.VS.DE051002200I</IndexLocation>
<StreamLocation>^WS.VS.DE051002200S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}