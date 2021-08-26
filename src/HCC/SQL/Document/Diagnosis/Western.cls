/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 西医诊断子表
Class HCC.SQL.Document.Diagnosis.Western Extends (%Persistent, %XML.Adaptor)
{

/// 西医诊断
Property diag As HCC.SQL.Document.DiagnosisItem [ SqlFieldName = diag ];

/// 文档编号
Relationship Diagnosis As HCC.SQL.Document.Diagnosis [ Cardinality = parent, Inverse = Westerns, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="WesternDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diag</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Westerns")</DataLocation>
<DefaultData>WesternDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DiagnosisC("Westerns")</IdLocation>
<IndexLocation>^HCC.SQL.Document.DA237.WesternI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.DA237.WesternS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
