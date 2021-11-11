/// 民族类别代码表（GB 3304）
Class WS.VS.GB33041991 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.3";

Storage Default
{
<Data name="GB33041991DefaultData">
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
<DataLocation>^WS.VS.GB33041991</DataLocation>
<DefaultData>GB33041991DefaultData</DefaultData>
<IdLocation>^WS.VS.GB33041991</IdLocation>
<IndexLocation>^WS.VS.GB33041991I</IndexLocation>
<StreamLocation>^WS.VS.GB33041991S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
