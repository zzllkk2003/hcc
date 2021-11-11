/// 经济状况代码表
Class WS.VS.DE020102300 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.31";

Storage Default
{
<Data name="DE020102300DefaultData">
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
<DataLocation>^WS.VS.DE020102300</DataLocation>
<DefaultData>DE020102300DefaultData</DefaultData>
<IdLocation>^WS.VS.DE020102300</IdLocation>
<IndexLocation>^WS.VS.DE020102300I</IndexLocation>
<StreamLocation>^WS.VS.DE020102300S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
