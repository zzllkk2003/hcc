/// 血吸虫病患者劳动能力分级代码表
Class WS.VS.CV0510008 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.146";

Storage Default
{
<Data name="CV0510008DefaultData">
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
<DataLocation>^WS.VS.CV0510008</DataLocation>
<DefaultData>CV0510008DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0510008</IdLocation>
<IndexLocation>^WS.VS.CV0510008I</IndexLocation>
<StreamLocation>^WS.VS.CV0510008S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
