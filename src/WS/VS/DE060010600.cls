/// 输血史标识代码表
Class WS.VS.DE060010600 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.42";

Storage Default
{
<Data name="DE060010600DefaultData">
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
<DataLocation>^WS.VS.DE060010600</DataLocation>
<DefaultData>DE060010600DefaultData</DefaultData>
<IdLocation>^WS.VS.DE060010600</IdLocation>
<IndexLocation>^WS.VS.DE060010600I</IndexLocation>
<StreamLocation>^WS.VS.DE060010600S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
