/// 呼吸类型代码表
Class WS.VS.DE060020800 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.1";

Storage Default
{
<Data name="DE060020800DefaultData">
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
<DataLocation>^WS.VS.DE060020800</DataLocation>
<DefaultData>DE060020800DefaultData</DefaultData>
<IdLocation>^WS.VS.DE060020800</IdLocation>
<IndexLocation>^WS.VS.DE060020800I</IndexLocation>
<StreamLocation>^WS.VS.DE060020800S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
