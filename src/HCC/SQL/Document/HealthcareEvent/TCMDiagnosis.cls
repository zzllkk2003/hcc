/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 卫生事件章节-中医诊断
Class HCC.SQL.Document.HealthcareEvent.TCMDiagnosis Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 中医病名代码
Property name As WS.DE.DE051013000 [ SqlFieldName = name ];

/// 中医症候代码
Property symptom As WS.DE.DE051013000 [ SqlFieldName = symptom ];

/// 病情归转
Property result As WS.DE.DE051011300 [ SqlFieldName = result ];

/// 文档编号
Relationship healthcareEvent As HCC.SQL.Document.HealthcareEvent [ Cardinality = parent, Inverse = TCMdiagnoses, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="TCMDiagnosisDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>symptom</Value>
</Value>
<Value name="4">
<Value>result</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("TCMdiagnoses")</DataLocation>
<DefaultData>TCMDiagnosisDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HealthcareE7CC8C("TCMdiagnoses")</IdLocation>
<IndexLocation>^HCC.SQL.Docume2E2.TCMDiagnosisI</IndexLocation>
<StreamLocation>^HCC.SQL.Docume2E2.TCMDiagnosisS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
