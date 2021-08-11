/// 既往史章节 - 传染病史条目子表
Class HCC.SQL.Document.PastHistory.Infection Extends (%Persistent, %XML.Adaptor)
{

/// 传染病史条目名称
Property name As WS.DE.DE021000800 [ SqlFieldName = name ];

/// 文档编号
Relationship PastHistory As HCC.SQL.Document.PastHistory(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Infections, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="InfectionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Infections")</DataLocation>
<DefaultData>InfectionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.PastHistoryC("Infections")</IdLocation>
<IndexLocation>^HCC.SQL.Document66A7.InfectionI</IndexLocation>
<StreamLocation>^HCC.SQL.Document66A7.InfectionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
