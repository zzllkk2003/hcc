/// 报卡类别代码表
Class WS.VS.DE010000200 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.20";

Storage Default
{
<Data name="DE010000200DefaultData">
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
<DataLocation>^WS.VS.DE010000200</DataLocation>
<DefaultData>DE010000200DefaultData</DefaultData>
<IdLocation>^WS.VS.DE010000200</IdLocation>
<IndexLocation>^WS.VS.DE010000200I</IndexLocation>
<StreamLocation>^WS.VS.DE010000200S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
