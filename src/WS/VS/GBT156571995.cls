/// 中医病证分类与代码表（ GB/T 15657-1995）
Class WS.VS.GBT156571995 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.14";

Storage Default
{
<Data name="GBT156571995DefaultData">
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
<DataLocation>^WS.VS.GBT156571995</DataLocation>
<DefaultData>GBT156571995DefaultData</DefaultData>
<IdLocation>^WS.VS.GBT156571995</IdLocation>
<IndexLocation>^WS.VS.GBT156571995I</IndexLocation>
<StreamLocation>^WS.VS.GBT156571995S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
