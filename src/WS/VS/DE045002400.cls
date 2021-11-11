/// 低血糖反应代码表
Class WS.VS.DE045002400 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.28";

Storage Default
{
<Data name="DE045002400DefaultData">
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
<DataLocation>^WS.VS.DE045002400</DataLocation>
<DefaultData>DE045002400DefaultData</DefaultData>
<IdLocation>^WS.VS.DE045002400</IdLocation>
<IndexLocation>^WS.VS.DE045002400I</IndexLocation>
<StreamLocation>^WS.VS.DE045002400S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
