/// 手术(操作)代码表（ICD-9-CM）
Class WS.VS.ICD9CM3 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.3.12";

Storage Default
{
<Data name="ICD9CM3DefaultData">
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
<DataLocation>^WS.VS.ICD9CM3</DataLocation>
<DefaultData>ICD9CM3DefaultData</DefaultData>
<IdLocation>^WS.VS.ICD9CM3</IdLocation>
<IndexLocation>^WS.VS.ICD9CM3I</IndexLocation>
<StreamLocation>^WS.VS.ICD9CM3S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
