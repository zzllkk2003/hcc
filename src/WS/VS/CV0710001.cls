/// 门诊费用分类代码表
Class WS.VS.CV0710001 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.196";

Storage Default
{
<Data name="CV0710001DefaultData">
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
<DataLocation>^WS.VS.CV0710001</DataLocation>
<DefaultData>CV0710001DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0710001</IdLocation>
<IndexLocation>^WS.VS.CV0710001I</IndexLocation>
<StreamLocation>^WS.VS.CV0710001S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}