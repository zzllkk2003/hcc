/// 病史陈述者
Class HCC.SQL.Document.Header.Informant Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 文档编号
Relationship DocumentNo As HCC.SQL.Document.Header [ Cardinality = parent, Inverse = Informants ];

Index DocumentNoIndex On DocumentNo;

/// 陈述者与患者关系代码
Property code As WS.DE.DE021002400 [ SqlFieldName = code ];

/// 陈述者姓名
Property name As WS.DE.DE020103900 [ SqlFieldName = name ];

Storage Default
{
<Data name="InformantDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
<Value name="3">
<Value>name</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Informants")</DataLocation>
<DefaultData>InformantDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.HeaderC("Informants")</IdLocation>
<IndexLocation>^HCC.SQL.DocumentEBE5.InformantI</IndexLocation>
<StreamLocation>^HCC.SQL.DocumentEBE5.InformantS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
