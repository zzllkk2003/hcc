/// 职业类别代码表（GB/T 6565）
Class WS.VS.GBT65652009 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.7";

Storage Default
{
<Data name="GBT65652009DefaultData">
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
<DataLocation>^WS.VS.GBT65652009</DataLocation>
<DefaultData>GBT65652009DefaultData</DefaultData>
<IdLocation>^WS.VS.GBT65652009</IdLocation>
<IndexLocation>^WS.VS.GBT65652009I</IndexLocation>
<StreamLocation>^WS.VS.GBT65652009S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
