/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 住院过程章节表
Class HCC.SQL.Document.HospitalCourse Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "8648-8";

Parameter SectionName = "Hospital Course";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 住院天数
Property stayDays As WS.DE.DE060031000 [ SqlFieldName = staydays ];

/// 治疗结果代码
Property result As WS.DE.DE051011300 [ SqlFieldName = result ];

/// 住院患者出院病房
Property dischargeWard As WS.DE.DE010001900 [ SqlFieldName = dchg_ward ];

/// 住院患者科室名称
Property dischargeDepartment As WS.DE.DE081002600 [ SqlFieldName = dchg_dept ];

/// 急诊留观病程记录
Property observationCourse As WS.DE.DE060018100 [ SqlFieldName = obs_course ];

/// 收入观察室日期时间
Property observationTime As WS.DE.DE060023500 [ SqlFieldName = obs_time ];

/// 入院情况
Property admitCondition As WS.DE.DE051014800 [ SqlFieldName = admit_cond ];

/// 诊疗过程描述 
Property treatmentCourse As WS.DE.DE060029600 [ SqlFieldName = treatment_course ];

/// 出院情况
Property dischargeCondition As WS.DE.DE060019300 [ SqlFieldName = dchg_cond ];

/// 死亡日期时间
Property deathTime As WS.DE.DE020103600 [ SqlFieldName = death_time ];

/// 死亡原因条目
Property deathReason As WS.DE.DE051009900 [ SqlFieldName = death_rsn ];

/// 死亡诊断-西医条目
Property deathDiag As HCC.SQL.Document.DiagnosisItem [ SqlFieldName = death_diag ];

/// 死亡诊断-中医条目表
Relationship TCMDiags As HCC.SQL.Document.HospitalCourse.DeathTCMDiag [ Cardinality = children, Inverse = HospitalCourse ];

Storage Default
{
<Data name="HospitalCourseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>stayDays</Value>
</Value>
<Value name="3">
<Value>result</Value>
</Value>
<Value name="4">
<Value>dischargeWard</Value>
</Value>
<Value name="5">
<Value>dischargeDepartment</Value>
</Value>
<Value name="6">
<Value>observationCourse</Value>
</Value>
<Value name="7">
<Value>observationTime</Value>
</Value>
<Value name="8">
<Value>admitCondition</Value>
</Value>
<Value name="9">
<Value>treatmentCourse</Value>
</Value>
<Value name="10">
<Value>dischargeCondition</Value>
</Value>
<Value name="11">
<Value>deathTime</Value>
</Value>
<Value name="12">
<Value>deathReason</Value>
</Value>
<Value name="13">
<Value>deathDiag</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Doc70F6.HospitalCourseD</DataLocation>
<DefaultData>HospitalCourseDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Doc70F6.HospitalCourseD</IdLocation>
<IndexLocation>^HCC.SQL.Doc70F6.HospitalCourseI</IndexLocation>
<StreamLocation>^HCC.SQL.Doc70F6.HospitalCourseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
