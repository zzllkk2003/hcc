/// 既往史章节 - 既往史条目子表
Class HCC.SQL.Document.PastHistory.Health Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 既往史条目名称
Property name As WS.DE.DE021009900 [ SqlFieldName = name ];

/// 文档编号
Relationship PastHistory As HCC.SQL.Document.PastHistory(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Healths, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="HealthDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Healths")</DataLocation>
<DefaultData>HealthDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.PastHistoryC("Healths")</IdLocation>
<IndexLocation>^HCC.SQL.Document.Pa66A7.HealthI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.Pa66A7.HealthS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
