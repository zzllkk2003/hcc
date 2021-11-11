/// 疑似食源性异常病例(健康事件)可疑病因代码表
Class WS.VS.CV0510017 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.155";

Storage Default
{
<Data name="CV0510017DefaultData">
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
<DataLocation>^WS.VS.CV0510017</DataLocation>
<DefaultData>CV0510017DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0510017</IdLocation>
<IndexLocation>^WS.VS.CV0510017I</IndexLocation>
<StreamLocation>^WS.VS.CV0510017S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
