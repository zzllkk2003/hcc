/// 病案质量等级表
Class WS.VS.DE090010300 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.29";

Storage Default
{
<Data name="DE090010300DefaultData">
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
<DataLocation>^WS.VS.DE090010300</DataLocation>
<DefaultData>DE090010300DefaultData</DefaultData>
<IdLocation>^WS.VS.DE090010300</IdLocation>
<IndexLocation>^WS.VS.DE090010300I</IndexLocation>
<StreamLocation>^WS.VS.DE090010300S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}