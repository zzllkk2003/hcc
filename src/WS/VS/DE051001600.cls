/// 传染病类别代码表
Class WS.VS.DE051001600 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.2.22";

Storage Default
{
<Data name="DE051001600DefaultData">
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
<DataLocation>^WS.VS.DE051001600</DataLocation>
<DefaultData>DE051001600DefaultData</DefaultData>
<IdLocation>^WS.VS.DE051001600</IdLocation>
<IndexLocation>^WS.VS.DE051001600I</IndexLocation>
<StreamLocation>^WS.VS.DE051001600S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}