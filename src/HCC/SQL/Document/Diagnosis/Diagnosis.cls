/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 西医诊断子表
Class HCC.SQL.Document.Diagnosis.Diagnosis Extends (%Persistent, %XML.Adaptor)
{

/// 主要诊断 - 疾病名称
Property diag As HCC.SQL.Document.DiagnosisItem [ SqlFieldName = diag ];

/// 文档编号
Relationship Diagnosis As HCC.SQL.Document.Diagnosis [ Cardinality = parent, Inverse = Diagnoses, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="DiagnosisDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diag</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Diagnoses")</DataLocation>
<DefaultData>DiagnosisDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DiagnosisC("Diagnoses")</IdLocation>
<IndexLocation>^HCC.SQL.DocumentA237.DiagnosisI</IndexLocation>
<StreamLocation>^HCC.SQL.DocumentA237.DiagnosisS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
