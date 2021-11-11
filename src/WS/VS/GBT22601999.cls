/// 中华人民共和国县级及县级以上行政区划代码表（GB/T 2260）
Class WS.VS.GBT22601999 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.2";

Storage Default
{
<Data name="GBT22601999DefaultData">
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
<DataLocation>^WS.VS.GBT22601999</DataLocation>
<DefaultData>GBT22601999DefaultData</DefaultData>
<IdLocation>^WS.VS.GBT22601999</IdLocation>
<IndexLocation>^WS.VS.GBT22601999I</IndexLocation>
<StreamLocation>^WS.VS.GBT22601999S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
