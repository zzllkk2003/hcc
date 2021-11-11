/// ICD-10
Class WS.VS.ICD10 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript ]
{

Parameter Name = "ICD10 诊断码表";

Storage Default
{
<Data name="CV0201101DefaultData">
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
<DataLocation>^WS.VS.ICD10</DataLocation>
<DefaultData>CV0201101DefaultData</DefaultData>
<IdLocation>^WS.VS.ICD10</IdLocation>
<IndexLocation>^WS.VS.ICD10</IndexLocation>
<StreamLocation>^WS.VS.ICD10S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

Parameter OID = "2.16.156.10011.2.3.3.11";

}
