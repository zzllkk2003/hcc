/// 中医体质分类判定结果代码表
Class WS.VS.DE050107300 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.11";

Storage Default
{
<Data name="DE050107300DefaultData">
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
<DataLocation>^WS.VS.DE050107300</DataLocation>
<DefaultData>DE050107300DefaultData</DefaultData>
<IdLocation>^WS.VS.DE050107300</IdLocation>
<IndexLocation>^WS.VS.DE050107300I</IndexLocation>
<StreamLocation>^WS.VS.DE050107300S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
