/// 既往史章节 - 输血史条目子表
Class HCC.SQL.Document.PastHistory.Transfusion Extends (%Persistent, %XML.Adaptor)
{

/// 输血史条目名称
Property name As WS.DE.DE021010100 [ SqlFieldName = name ];

/// 文档编号
Relationship PastHistory As HCC.SQL.Document.PastHistory(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Transfusions, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="TransfusionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Transfusions")</DataLocation>
<DefaultData>TransfusionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.PastHistoryC("Transfusions")</IdLocation>
<IndexLocation>^HCC.SQL.Docume66A7.TransfusionI</IndexLocation>
<StreamLocation>^HCC.SQL.Docume66A7.TransfusionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
