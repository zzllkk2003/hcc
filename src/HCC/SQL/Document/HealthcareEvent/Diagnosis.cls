/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 卫生事件章节-西医诊断条目表
Class HCC.SQL.Document.HealthcareEvent.Diagnosis Extends (%Persistent, %XML.Adaptor)
{

/// 西医诊断编码
Property name As WS.DE.DE050102400 [ SqlFieldName = diag ];

/// 病情归转
Property result As WS.DE.DE051011300 [ SqlFieldName = result ];

/// 文档编号
Relationship healthcareEvent As HCC.SQL.Document.HealthcareEvent [ Cardinality = parent, Inverse = diagnoses, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="DiagnosisDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>result</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("diagnoses")</DataLocation>
<DefaultData>DiagnosisDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HealthcareE7CC8C("diagnoses")</IdLocation>
<IndexLocation>^HCC.SQL.Document2E2.DiagnosisI</IndexLocation>
<StreamLocation>^HCC.SQL.Document2E2.DiagnosisS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
