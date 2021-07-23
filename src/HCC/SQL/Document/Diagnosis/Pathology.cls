/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 病理诊断
Class HCC.SQL.Document.Diagnosis.Pathology Extends (%Persistent, %XML.Adaptor)
{

/// 病理号标识
Property PathologyNo As WS.DE.DE010000500 [ Required, SqlFieldName = pathology_no ];

/// 主要诊断 - 疾病名称
Property diagnosisName As WS.DE.DE050102500 [ Required, SqlFieldName = diagnosis_name ];

/// 主要诊断 - 疾病代码
Property diagnosisCode As WS.DE.DE050102400 [ Required, SqlFieldName = diagnosis_code ];

Relationship Diagnosis As HCC.SQL.Document.Diagnosis [ Cardinality = parent, Inverse = Pathologys, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="PathologyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diagnosisName</Value>
</Value>
<Value name="3">
<Value>diagnosisCode</Value>
</Value>
<Value name="4">
<Value>PathologyNo</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Pathologys")</DataLocation>
<DefaultData>PathologyDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DiagnosisC("Pathologys")</IdLocation>
<IndexLocation>^HCC.SQL.DocumentA237.PathologyI</IndexLocation>
<StreamLocation>^HCC.SQL.DocumentA237.PathologyS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
