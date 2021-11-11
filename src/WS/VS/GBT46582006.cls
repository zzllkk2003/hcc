/// 学历代码表（GB/T 4658）
Class WS.VS.GBT46582006 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.6";

Storage Default
{
<Data name="GBT46582006DefaultData">
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
<DataLocation>^WS.VS.GBT46582006</DataLocation>
<DefaultData>GBT46582006DefaultData</DefaultData>
<IdLocation>^WS.VS.GBT46582006</IdLocation>
<IndexLocation>^WS.VS.GBT46582006I</IndexLocation>
<StreamLocation>^WS.VS.GBT46582006S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
