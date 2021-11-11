/// 专业技术职务代码（ GB/T 8561-1988）
Class WS.VS.GBT85612001 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.10";

Storage Default
{
<Data name="GBT85612001DefaultData">
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
<DataLocation>^WS.VS.GBT85612001</DataLocation>
<DefaultData>GBT85612001DefaultData</DefaultData>
<IdLocation>^WS.VS.GBT85612001</IdLocation>
<IndexLocation>^WS.VS.GBT85612001I</IndexLocation>
<StreamLocation>^WS.VS.GBT85612001S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
