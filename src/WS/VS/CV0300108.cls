/// 饮食频率分类代表
Class WS.VS.CV0300108 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.20";

Storage Default
{
<Data name="CV0300108DefaultData">
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
<DataLocation>^WS.VS.CV0300108</DataLocation>
<DefaultData>CV0300108DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0300108</IdLocation>
<IndexLocation>^WS.VS.CV0300108I</IndexLocation>
<StreamLocation>^WS.VS.CV0300108S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
