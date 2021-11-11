/// 梅毒血清学试验结果代码表
Class WS.VS.DE045004100 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.18";

Storage Default
{
<Data name="DE045004100DefaultData">
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
<DataLocation>^WS.VS.DE045004100</DataLocation>
<DefaultData>DE045004100DefaultData</DefaultData>
<IdLocation>^WS.VS.DE045004100</IdLocation>
<IndexLocation>^WS.VS.DE045004100I</IndexLocation>
<StreamLocation>^WS.VS.DE045004100S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
