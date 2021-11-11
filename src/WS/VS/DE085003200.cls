/// 处方类别代码表
Class WS.VS.DE085003200 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.40";

Storage Default
{
<Data name="DE085003200DefaultData">
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
<DataLocation>^WS.VS.DE085003200</DataLocation>
<DefaultData>DE085003200DefaultData</DefaultData>
<IdLocation>^WS.VS.DE085003200</IdLocation>
<IndexLocation>^WS.VS.DE085003200I</IndexLocation>
<StreamLocation>^WS.VS.DE085003200S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
