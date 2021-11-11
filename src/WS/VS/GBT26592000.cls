/// 世界各国和地区名称代码(GB/T 2659)
Class WS.VS.GBT26592000 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.1";

Storage Default
{
<Data name="GBT26592000DefaultData">
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
<DataLocation>^WS.VS.GBT26592000</DataLocation>
<DefaultData>GBT26592000DefaultData</DefaultData>
<IdLocation>^WS.VS.GBT26592000</IdLocation>
<IndexLocation>^WS.VS.GBT26592000I</IndexLocation>
<StreamLocation>^WS.VS.GBT26592000S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
