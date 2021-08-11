/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 主要健康问题章节表
Class HCC.SQL.Document.HealthProblem Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "11450-4";

Parameter SectionName = "PROBLEM LIST";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 住院者疾病状态代码
Property sickCondition As WS.DE.DE050107200 [ SqlFieldName = sick_cond ];

/// 住院患者损伤和中毒外部原因
Property damageReason As WS.DE.DE051015200 [ SqlFieldName = damage_rsn ];

/// 损伤和中毒的外部原因 - 疾病编码
Property damageDiag As WS.DE.DE050107800 [ SqlFieldName = damage_diag ];

/// 颅脑损伤患者入院前昏迷时间 
Property comaBeforeAdmit As HCC.SQL.Document.HealthProblem.ComaBeforeAdmit [ SqlFieldName = CBA ];

/// 颅脑损伤患者入院后昏迷时间 
Property comaAfterAdmit As HCC.SQL.Document.HealthProblem.ComaAfterAdmit [ SqlFieldName = CAA ];

/// 常规监测项目名称。用于《麻醉记录》
Property regularMonitor As WS.DE.DE060021600 [ SqlFieldName = reg_monitor ];

/// 常规监测项目结果。用于《麻醉记录》
Property regularMonitorResult As WS.DE.DE060028100 [ SqlFieldName = reg_monitor_rslt ];

/// 特殊监测项目名称。用于《麻醉记录》
Property specialMonitor As WS.DE.DE060021600 [ SqlFieldName = spec_monitor ];

/// 特殊监测项目名称。用于《麻醉记录》
Property specialMonitorResult As WS.DE.DE060021600 [ SqlFieldName = spec_monitor_rslt ];

/// 麻醉恢复情况。用于《麻醉术后访视记录》
Property anesthesiaRecovery As WS.DE.DE060022500 [ SqlFieldName = anesth_recvr ];

/// 清醒日期时间。用于《麻醉术后访视记录》
Property wakeupTime As WS.DE.DE060023300 [ SqlFieldName = wakeup_time ];

/// 拔除气管插管标志。用于《麻醉术后访视记录》
Property intubationRemoval As WS.DE.DE051016500 [ SqlFieldName = intubation_rem ];

/// 特殊情况。用于《麻醉术后访视记录》
Property exception As WS.DE.DE051015800 [ SqlFieldName = excep ];

/// 主要健康问题章节-待产记录。用于《待产记录》
Property inlabor As HCC.SQL.Document.HealthProblem.Inlabor [ SqlFieldName = inlabor ];

/// 主要健康问题章节-中医住院病案首页。用于《中医住院病案首页》
Property TCM As HCC.SQL.Document.HealthProblem.TCM [ SqlFieldName = TCM ];

/// 陈述内容可靠标识。用于《入院记录》、《24h内入出院记录》
Property reliableStatement As WS.DE.DE051014300 [ SqlFieldName = reliable_stat ];

/// 中医“四诊”观察结果。用于《入院记录》、《24h内入出院记录》
Property TCMObservation As WS.DE.DE021002800 [ SqlFieldName = TCM_obs ];

/// 主要健康问题章节 - 初步诊断-西医条目。用于 《入院记录》
Property preliminaryDiag As HCC.SQL.Document.DiagnosisItem [ SqlFieldName = prelim_diag ];

/// 主要健康问题章节 - 初步诊断-中医条目。用于 《入院记录》
Property TCMPreliminaryDiag As HCC.SQL.Document.HealthProblem.TCMPreliminaryDiag [ SqlFieldName = TCM_prelim_diag ];

/// 主要健康问题章节 - 修正诊断-西医条目。用于《入院记录》
Property revisedDiag As HCC.SQL.Document.DiagnosisItem [ SqlFieldName = revised_diag ];

/// 主要健康问题章节 - 修正诊断-中医条目。用于《入院记录》
Property TCMRevisedDiag As HCC.SQL.Document.HealthProblem.TCMRevisedDiag [ SqlFieldName = TCM_revised_diag ];

/// 主要健康问题章节 - 补充诊断-西医条目。用于 《入院记录》
Property supplementaryDiag As HCC.SQL.Document.DiagnosisItem [ SqlFieldName = supl_diag ];

/// 西医诊断子表(确定诊断)。用于 《入院记录》
Relationship diagnoses As HCC.SQL.Document.HealthProblem.ConfirmedDiag [ Cardinality = children, Inverse = healthProblem ];

/// 中医诊断子表(确定诊断)。用于 《入院记录》
Relationship TCMdiagnoses As HCC.SQL.Document.HealthProblem.TCMConfirmedDiag [ Cardinality = children, Inverse = healthProblem ];

/// 症状名称。用于 《24h内入出院记录》
Property symptom As WS.DE.DE040111800 [ SqlFieldName = symptom ];

/// 症状描述。用于《24h内入出院记录》
Property symptomNotes As WS.DE.DE040111700 [ SqlFieldName = symptom_notes ];

/// 住院病程。用于《日常病程记录》
Property hospitalCourse As WS.DE.DE060030900 [ SqlFieldName = hospital_course ];

/// 入院情况 。用于《出院小结》
Property admitCondition As WS.DE.DE051014800 [ SqlFieldName = admit_cond ];

Storage Default
{
<Data name="HealthProblemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>sickCondition</Value>
</Value>
<Value name="3">
<Value>damageReason</Value>
</Value>
<Value name="4">
<Value>damageDiag</Value>
</Value>
<Value name="5">
<Value>comaDays</Value>
</Value>
<Value name="6">
<Value>comaHours</Value>
</Value>
<Value name="7">
<Value>comaMinutes</Value>
</Value>
<Value name="8">
<Value>comaBeforeAdmit</Value>
</Value>
<Value name="9">
<Value>comaAfterAdmit</Value>
</Value>
<Value name="10">
<Value>regularMonitor</Value>
</Value>
<Value name="11">
<Value>regularMonitorValue</Value>
</Value>
<Value name="12">
<Value>specialMonitor</Value>
</Value>
<Value name="13">
<Value>specialMonitorValue</Value>
</Value>
<Value name="14">
<Value>regularMonitorResult</Value>
</Value>
<Value name="15">
<Value>specialMonitorResult</Value>
</Value>
<Value name="16">
<Value>anesthesiaRecovery</Value>
</Value>
<Value name="17">
<Value>wakeupTime</Value>
</Value>
<Value name="18">
<Value>intubationRemoval</Value>
</Value>
<Value name="19">
<Value>exception</Value>
</Value>
<Value name="20">
<Value>inlabor</Value>
</Value>
<Value name="21">
<Value>TCM</Value>
</Value>
<Value name="22">
<Value>reliableStatement</Value>
</Value>
<Value name="23">
<Value>TCMObservation</Value>
</Value>
<Value name="24">
<Value>preliminaryDiag</Value>
</Value>
<Value name="25">
<Value>TCMpreliminaryDiag</Value>
</Value>
<Value name="26">
<Value>TCMPreliminaryDiag</Value>
</Value>
<Value name="27">
<Value>revisedDiag</Value>
</Value>
<Value name="28">
<Value>TCMRevisedDiag</Value>
</Value>
<Value name="29">
<Value>supplementaryDiag</Value>
</Value>
<Value name="30">
<Value>symptom</Value>
</Value>
<Value name="31">
<Value>symptomNotes</Value>
</Value>
<Value name="32">
<Value>hospitalCourse</Value>
</Value>
<Value name="33">
<Value>admitCondition</Value>
</Value>
<Value name="34">
<Value>TCMPreliminarySyndrome</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Docu70F6.HealthProblemD</DataLocation>
<DefaultData>HealthProblemDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.HealthProblemD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.HealthProblemI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.HealthProblemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
