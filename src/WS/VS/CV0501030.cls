/// 慢性乙型肝炎的临床分级代码表
Class WS.VS.CV0501030 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.129";

Storage Default
{
<Data name="CV0501030DefaultData">
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
<DataLocation>^WS.VS.CV0501030</DataLocation>
<DefaultData>CV0501030DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0501030</IdLocation>
<IndexLocation>^WS.VS.CV0501030I</IndexLocation>
<StreamLocation>^WS.VS.CV0501030S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
