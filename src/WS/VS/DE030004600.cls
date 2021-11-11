/// 目标摄盐量分级代码
Class WS.VS.DE030004600 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.25";

Storage Default
{
<Data name="DE030004600DefaultData">
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
<DataLocation>^WS.VS.DE030004600</DataLocation>
<DefaultData>DE030004600DefaultData</DefaultData>
<IdLocation>^WS.VS.DE030004600</IdLocation>
<IndexLocation>^WS.VS.DE030004600I</IndexLocation>
<StreamLocation>^WS.VS.DE030004600S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
