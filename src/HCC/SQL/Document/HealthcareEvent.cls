/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 卫生事件章节表
Class HCC.SQL.Document.HealthcareEvent Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "卫生事件";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 医疗机构科室名称
Property departmentName As WS.DE.DE081002600 [ Required, SqlFieldName = dept_name ];

/// 患者类型
Property patientType As WS.DE.DE020106000 [ Required, SqlFieldName = pat_type ];

/// 门(急)诊号
Property outpatientNum As WS.DE.DE010001000 [ Required, SqlFieldName = op_num ];

/// 住院号
Property inpatientNum As WS.DE.DE010001400 [ SqlFieldName = ip_num ];

/// 入出院时间条目
Property time As HCC.SQL.Document.HealthcareEvent.Time [ SqlFieldName = time ];

/// 发病日期时间
Property sickTime As WS.DE.DE040101800 [ SqlFieldName = sick_time ];

/// 就诊原因名称
Property admissionReason As WS.DE.DE051005300 [ SqlFieldName = adm_rsn ];

/// 就诊日期时间
Property encounterTime As WS.DE.DE060006200 [ SqlFieldName = enc_time ];

/// 西医诊断编码条目子表
Relationship diagnoses As HCC.SQL.Document.HealthcareEvent.Diagnosis [ Cardinality = children, Inverse = healthcareEvent ];

/// 其他西医诊断
Property otherDiagnosis As WS.DE.DE050102400 [ SqlFieldName = oth_diag ];

/// 中医诊断条目子表
Relationship TCMdiagnoses As HCC.SQL.Document.HealthcareEvent.TCMDiagnosis [ Cardinality = children, Inverse = healthcareEvent ];

/// 手术及操作条目子表
Relationship operations As HCC.SQL.Document.HealthcareEvent.Operation [ Cardinality = children, Inverse = healthcareEvent ];

/// 关键药物条目子表
Relationship keyMedicines As HCC.SQL.Document.HealthcareEvent.KeyMedicine [ Cardinality = children, Inverse = healthcareEvent ];

/// 其他处置
Property otherTreatment As WS.DE.DE060025100 [ SqlFieldName = oth_treat ];

/// 根本死因
Property deathReason As WS.DE.DE050102100 [ SqlFieldName = death_rsn ];

/// 责任医师姓名
Property doctorName As WS.DE.DE020103900 [ SqlFieldName = doc_name ];

/// 费用
Property fee As HCC.SQL.Document.HealthcareEvent.Fee [ SqlFieldName = fee ];

Storage Default
{
<Data name="HealthcareEventDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>departmentName</Value>
</Value>
<Value name="3">
<Value>patientType</Value>
</Value>
<Value name="4">
<Value>outpatientNum</Value>
</Value>
<Value name="5">
<Value>inpatientNum</Value>
</Value>
<Value name="6">
<Value>time</Value>
</Value>
<Value name="7">
<Value>sickTime</Value>
</Value>
<Value name="8">
<Value>admissionReason</Value>
</Value>
<Value name="9">
<Value>encounterTime</Value>
</Value>
<Value name="10">
<Value>otherDiagnosis</Value>
</Value>
<Value name="11">
<Value>otherTreatment</Value>
</Value>
<Value name="12">
<Value>deathReason</Value>
</Value>
<Value name="13">
<Value>doctorName</Value>
</Value>
<Value name="14">
<Value>fee</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.HealthcareE7CC8D</DataLocation>
<DefaultData>HealthcareEventDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HealthcareE7CC8D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.HealthcareE7CC8I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.HealthcareE7CC8S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
