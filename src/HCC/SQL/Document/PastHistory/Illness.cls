/// 既往史章节 - 疾病史条目子表
Class HCC.SQL.Document.PastHistory.Illness Extends (%Persistent, %XML.Adaptor)
{

/// 疾病史条目名称
Property name As WS.DE.DE021002600 [ SqlFieldName = name ];

/// 文档编号
Relationship PastHistory As HCC.SQL.Document.PastHistory(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Illnesses, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="IllnessDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Illnesses")</DataLocation>
<DefaultData>IllnessDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.PastHistoryC("Illnesses")</IdLocation>
<IndexLocation>^HCC.SQL.Document.P66A7.IllnessI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.P66A7.IllnessS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
