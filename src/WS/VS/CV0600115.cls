/// 抗结核治疗停止原因代码表
Class WS.VS.CV0600115 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.171";

Storage Default
{
<Data name="CV0600115DefaultData">
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
<DataLocation>^WS.VS.CV0600115</DataLocation>
<DefaultData>CV0600115DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0600115</IdLocation>
<IndexLocation>^WS.VS.CV0600115I</IndexLocation>
<StreamLocation>^WS.VS.CV0600115S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
