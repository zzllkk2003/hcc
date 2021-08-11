/// 既往史章节 - 孕产史条目子表
Class HCC.SQL.Document.PastHistory.Obstetric Extends (%Persistent, %XML.Adaptor)
{

/// 孕产史条目名称
Property name As WS.DE.DE021009800 [ SqlFieldName = name ];

/// 文档编号
Relationship PastHistory As HCC.SQL.Document.PastHistory(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Obstetrics, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="ObstetricDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Obstetrics")</DataLocation>
<DefaultData>ObstetricDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.PastHistoryC("Obstetrics")</IdLocation>
<IndexLocation>^HCC.SQL.Document66A7.ObstetricI</IndexLocation>
<StreamLocation>^HCC.SQL.Document66A7.ObstetricS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
