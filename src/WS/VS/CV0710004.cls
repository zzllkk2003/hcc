/// 医疗费用结箅方式代码表
Class WS.VS.CV0710004 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.198";

Storage Default
{
<Data name="CV0710004DefaultData">
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
<DataLocation>^WS.VS.CV0710004</DataLocation>
<DefaultData>CV0710004DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0710004</IdLocation>
<IndexLocation>^WS.VS.CV0710004I</IndexLocation>
<StreamLocation>^WS.VS.CV0710004S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
