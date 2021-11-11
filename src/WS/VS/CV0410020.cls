/// 儿童体格发育评价代码
Class WS.VS.CV0410020 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.74";

Storage Default
{
<Data name="CV0410020DefaultData">
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
<DataLocation>^WS.VS.CV0410020</DataLocation>
<DefaultData>CV0410020DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0410020</IdLocation>
<IndexLocation>^WS.VS.CV0410020I</IndexLocation>
<StreamLocation>^WS.VS.CV0410020S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
