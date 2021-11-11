/// 重性精神疾病患者危险性分级代码表
Class WS.VS.CV0510013 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.151";

Storage Default
{
<Data name="CV0510013DefaultData">
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
<DataLocation>^WS.VS.CV0510013</DataLocation>
<DefaultData>CV0510013DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0510013</IdLocation>
<IndexLocation>^WS.VS.CV0510013I</IndexLocation>
<StreamLocation>^WS.VS.CV0510013S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
