/// 家族近亲婚配者与本人关系代码表
Class WS.VS.CV0210001 Extends WS.VS.Base [ ClassType = persistent, Language = objectscript, Not ProcedureBlock ]
{

Parameter OID = "2.16.156.10011.2.3.1.8";

Storage Default
{
<Data name="CV0210001DefaultData">
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
<DataLocation>^WS.VS.CV0210001</DataLocation>
<DefaultData>CV0210001DefaultData</DefaultData>
<IdLocation>^WS.VS.CV0210001</IdLocation>
<IndexLocation>^WS.VS.CV0210001I</IndexLocation>
<StreamLocation>^WS.VS.CV0210001S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
