/// 每年食用的食物食用频率代码表
Class WS.VS.CV0300110 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.22";

Storage Default
{
<Data name="CV0300110DefaultData">
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
<DataLocation>^WS.VS.CV0300110</DataLocation>
<DefaultData>CV0300110DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0300110</IdLocation>
<IndexLocation>^WS.VS.CV0300110I</IndexLocation>
<StreamLocation>^WS.VS.CV0300110S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
