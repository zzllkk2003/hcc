/// 饮食情况代码表
Class WS.VS.DE030008000 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.34";

Storage Default
{
<Data name="DE030008000DefaultData">
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
<DataLocation>^WS.VS.DE030008000</DataLocation>
<DefaultData>DE030008000DefaultData</DefaultData>
<IdLocation>^WS.VS.DE030008000</IdLocation>
<IndexLocation>^WS.VS.DE030008000I</IndexLocation>
<StreamLocation>^WS.VS.DE030008000S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
