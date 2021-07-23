/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 门急诊诊断
Class HCC.SQL.Document.Diagnosis.Outpatient Extends (%Persistent, %XML.Adaptor)
{

/// 主要诊断 - 疾病名称
Property diagnosisName As WS.DE.DE050102500 [ SqlFieldName = diagnosis_name ];

/// 主要诊断 - 疾病代码
Property diagnosisCode As WS.DE.DE050102400 [ SqlFieldName = diagnosis_code ];

Relationship Diagnosis As HCC.SQL.Document.Diagnosis [ Cardinality = parent, Inverse = Outpatients, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="OutpatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diagnosisName</Value>
</Value>
<Value name="3">
<Value>diagnosisCode</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Outpatients")</DataLocation>
<DefaultData>OutpatientDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DiagnosisC("Outpatients")</IdLocation>
<IndexLocation>^HCC.SQL.DocumenA237.OutpatientI</IndexLocation>
<StreamLocation>^HCC.SQL.DocumenA237.OutpatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
