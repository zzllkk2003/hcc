/// 既往史章节 - 手术史条目子表
Class HCC.SQL.Document.PastHistory.Surgery Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 手术史条目名称
Property name As WS.DE.DE021000800 [ SqlFieldName = name ];

/// 文档编号
Relationship PastHistory As HCC.SQL.Document.PastHistory(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Surgeries, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="SurgeryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Surgeries")</DataLocation>
<DefaultData>SurgeryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.PastHistoryC("Surgeries")</IdLocation>
<IndexLocation>^HCC.SQL.Document.P66A7.SurgeryI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.P66A7.SurgeryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
