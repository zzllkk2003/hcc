/// Author: QP
/// Version: 1.0
/// Date:2021/08
/// 诊断记录 - 中医四诊观察结果
Class HCC.SQL.Document.Diagnosis.TCMFourDiagnostic Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 中医四诊观察结果
Property TCMFourDiagnostic As WS.DE.DE020102800 [ SqlFieldName = obs ];

/// 病案编号
Relationship Diagnosis As HCC.SQL.Document.Diagnosis [ Cardinality = parent, Inverse = TCMFourDiags, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="TCMFourDiagnosticDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>TCMFourDiagnostic</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("TCMFourDiags")</DataLocation>
<DefaultData>TCMFourDiagnosticDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DiagnosisC("TCMFourDiags")</IdLocation>
<IndexLocation>^HCC.SQL.DoA237.TCMFourDiagD604I</IndexLocation>
<StreamLocation>^HCC.SQL.DoA237.TCMFourDiagD604S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
