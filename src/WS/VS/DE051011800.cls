/// 重性精神疾病患者随访评价结果代码表
Class WS.VS.DE051011800 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.37";

Storage Default
{
<Data name="DE051011800DefaultData">
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
<DataLocation>^WS.VS.DE051011800</DataLocation>
<DefaultData>DE051011800DefaultData</DefaultData>
<IdLocation>^WS.VS.DE051011800</IdLocation>
<IndexLocation>^WS.VS.DE051011800I</IndexLocation>
<StreamLocation>^WS.VS.DE051011800S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
