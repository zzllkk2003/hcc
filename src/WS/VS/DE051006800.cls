/// 随访遵医行为评价结果代码表
Class WS.VS.DE051006800 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.27";

Storage Default
{
<Data name="DE051006800DefaultData">
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
<DataLocation>^WS.VS.DE051006800</DataLocation>
<DefaultData>DE051006800DefaultData</DefaultData>
<IdLocation>^WS.VS.DE051006800</IdLocation>
<IndexLocation>^WS.VS.DE051006800I</IndexLocation>
<StreamLocation>^WS.VS.DE051006800S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
