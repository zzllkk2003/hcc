/// 中药使用类别代码表
Class WS.VS.CV0600101 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.157";

Storage Default
{
<Data name="CV0600101DefaultData">
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
<DataLocation>^WS.VS.CV0600101</DataLocation>
<DefaultData>CV0600101DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0600101</IdLocation>
<IndexLocation>^WS.VS.CV0600101I</IndexLocation>
<StreamLocation>^WS.VS.CV0600101S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
