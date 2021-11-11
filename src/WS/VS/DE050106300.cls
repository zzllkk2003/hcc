/// 职业病种类代码表（卫监发[2002]108号《职业病目录》）
Class WS.VS.DE050106300 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.4.2";

Storage Default
{
<Data name="DE050106300DefaultData">
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
<DataLocation>^WS.VS.DE050106300</DataLocation>
<DefaultData>DE050106300DefaultData</DefaultData>
<IdLocation>^WS.VS.DE050106300</IdLocation>
<IndexLocation>^WS.VS.DE050106300I</IndexLocation>
<StreamLocation>^WS.VS.DE050106300S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}