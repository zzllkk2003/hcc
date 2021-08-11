/// 主要健康问题章节 - 确定诊断-西医条目子表
Class HCC.SQL.Document.HealthProblem.ConfirmedDiag Extends (%Persistent, %XML.Adaptor)
{

/// 西医诊断名称
Property diag As HCC.SQL.Document.DiagnosisItem [ SqlFieldName = diag ];

/// 文档编号
Relationship healthProblem As HCC.SQL.Document.HealthProblem [ Cardinality = parent, Inverse = diagnoses, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="ConfirmedDiagDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>code</Value>
</Value>
<Value name="4">
<Value>date</Value>
</Value>
<Value name="5">
<Value>orders</Value>
</Value>
<Value name="6">
<Value>diag</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("diagnoses")</DataLocation>
<DefaultData>ConfirmedDiagDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.HealthProblemC("diagnoses")</IdLocation>
<IndexLocation>^HCC.SQL.DocuDAD8.ConfirmedDiagI</IndexLocation>
<StreamLocation>^HCC.SQL.DocuDAD8.ConfirmedDiagS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
