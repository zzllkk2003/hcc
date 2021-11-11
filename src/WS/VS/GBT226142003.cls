/// 从业状况（个人身体）代码表（GB/T 2261.4）
Class WS.VS.GBT226142003 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.13";

Storage Default
{
<Data name="GBT226142003DefaultData">
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
<DataLocation>^WS.VS.GBT226142003</DataLocation>
<DefaultData>GBT226142003DefaultData</DefaultData>
<IdLocation>^WS.VS.GBT226142003</IdLocation>
<IndexLocation>^WS.VS.GBT226142003I</IndexLocation>
<StreamLocation>^WS.VS.GBT226142003S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
