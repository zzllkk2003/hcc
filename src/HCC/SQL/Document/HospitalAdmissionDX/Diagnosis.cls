/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 入院诊断 - 西医条目子表
Class HCC.SQL.Document.HospitalAdmissionDX.Diagnosis Extends (%Persistent, %XML.Adaptor)
{

/// 诊断
Property diag As HCC.SQL.Document.DiagnosisItem [ SqlFieldName = diag ];

/// 文档编号
Relationship HospitalAdmissionDX As HCC.SQL.Document.HospitalAdmissionDX [ Cardinality = parent, Inverse = Diagnoses, SqlFieldName = DocumentNo ];

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
<IdLocation>^HCC.SQL.Do70F6.HospitalAdmFB9AC("Diagnoses")</IdLocation>
<IndexLocation>^HCC.SQL.DocumentFBF2.DiagnosisI</IndexLocation>
<StreamLocation>^HCC.SQL.DocumentFBF2.DiagnosisS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
