/// 卫生机构分类代码表（WS 218-2002）
Class WS.VS.WS2182002 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.4.1";

Storage Default
{
<Data name="WS2182002DefaultData">
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
<DataLocation>^WS.VS.WS2182002</DataLocation>
<DefaultData>WS2182002DefaultData</DefaultData>
<IdLocation>^WS.VS.WS2182002</IdLocation>
<IndexLocation>^WS.VS.WS2182002I</IndexLocation>
<StreamLocation>^WS.VS.WS2182002S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
