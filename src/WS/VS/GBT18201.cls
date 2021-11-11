/// 职业性放射性疾病名称代码表（GB/T 18201）
Class WS.VS.GBT18201 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.9";

Storage Default
{
<Data name="GBT18201DefaultData">
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
<DataLocation>^WS.VS.GBT18201</DataLocation>
<DefaultData>GBT18201DefaultData</DefaultData>
<IdLocation>^WS.VS.GBT18201</IdLocation>
<IndexLocation>^WS.VS.GBT18201I</IndexLocation>
<StreamLocation>^WS.VS.GBT18201S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
