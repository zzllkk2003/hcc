/// 校内辅助设施类别代码表
Class WS.VS.CV0900209 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.235";

Storage Default
{
<Data name="CV0900209DefaultData">
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
<DataLocation>^WS.VS.CV0900209</DataLocation>
<DefaultData>CV0900209DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0900209</IdLocation>
<IndexLocation>^WS.VS.CV0900209I</IndexLocation>
<StreamLocation>^WS.VS.CV0900209S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
