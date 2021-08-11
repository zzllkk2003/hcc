/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 病理诊断子表
Class HCC.SQL.Document.Diagnosis.Pathology Extends (%Persistent, %XML.Adaptor)
{

/// 病理号标识
Property PathologyNo As WS.DE.DE010000500 [ Required, SqlFieldName = pathology_no ];

/// 诊断
Property diag As HCC.SQL.Document.DiagnosisItem [ SqlFieldName = diag ];

/// 病案编号
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
<Value name="5">
<Value>diag</Value>
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
