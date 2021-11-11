/// 艾滋病抗病毒治疗停药原因代码表
Class WS.VS.CV0600118 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.174";

Storage Default
{
<Data name="CV0600118DefaultData">
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
<DataLocation>^WS.VS.CV0600118</DataLocation>
<DefaultData>CV0600118DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0600118</IdLocation>
<IndexLocation>^WS.VS.CV0600118I</IndexLocation>
<StreamLocation>^WS.VS.CV0600118S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
