/// 家族疾病史类别代码表
Class WS.VS.DE021003900 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.17";

Storage Default
{
<Data name="DE021003900DefaultData">
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
<DataLocation>^WS.VS.DE021003900</DataLocation>
<DefaultData>DE021003900DefaultData</DefaultData>
<IdLocation>^WS.VS.DE021003900</IdLocation>
<IndexLocation>^WS.VS.DE021003900I</IndexLocation>
<StreamLocation>^WS.VS.DE021003900S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
