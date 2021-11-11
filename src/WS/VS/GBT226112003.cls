/// 生理性别代码表（GB/T 2261.1）
Class WS.VS.GBT226112003 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.4";

Storage Default
{
<Data name="GBT226112003DefaultData">
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
<DataLocation>^WS.VS.GBT226112003</DataLocation>
<DefaultData>GBT226112003DefaultData</DefaultData>
<IdLocation>^WS.VS.GBT226112003</IdLocation>
<IndexLocation>^WS.VS.GBT226112003I</IndexLocation>
<StreamLocation>^WS.VS.GBT226112003S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
