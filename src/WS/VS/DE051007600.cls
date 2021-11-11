/// 新生儿听力筛查情况代码表
Class WS.VS.DE051007600 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.14";

Storage Default
{
<Data name="DE051007600DefaultData">
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
<DataLocation>^WS.VS.DE051007600</DataLocation>
<DefaultData>DE051007600DefaultData</DefaultData>
<IdLocation>^WS.VS.DE051007600</IdLocation>
<IndexLocation>^WS.VS.DE051007600I</IndexLocation>
<StreamLocation>^WS.VS.DE051007600S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
