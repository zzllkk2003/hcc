/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 治疗计划章节表
Class HCC.SQL.Document.TreatmentPlan Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "18776-5";

Parameter SectionName = "TREATMENT PLAN";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 出院31天内再住院标志
Property readmission As WS.DE.DE060019400 [ SqlFieldName = rdm ];

/// 出院31天内再住院目的
Property readmissionReason As WS.DE.DE060019500 [ SqlFieldName = rdm_rsn ];

/// 中医辨证依据。用于《门急诊病历》
Property differentiationBasis As WS.DE.DE051013200 [ SqlFieldName = diff_basis ];

/// 辩证论治详细描述。用于《上级医师查房记录》
Property differentiationNotes As WS.DE.DE051013100 [ SqlFieldName = diff_notes ];

/// 中医治则治法。用于《门急诊病历》、《中药处方》
Property treatmentPrinciple As WS.DE.DE060030000 [ SqlFieldName = treat_prin ];

/// 医嘱备注信息。 用于《中药处方》、《治疗记录》
Property notes As WS.DE.DE060017900 [ SqlFieldName = notes ];

/// 处理及指导意见。用于《治疗记录》
Property guide As WS.DE.DE060001800 [ SqlFieldName = guide ];

/// 今后治疗方案。用于《治疗记录》
Property plan As WS.DE.DE060015900 [ SqlFieldName = plan ];

/// 治理计划 - 随访
Property followup As HCC.SQL.Document.TreatmentPlan.Followup [ SqlFieldName = followup ];

/// 拟实施手术及操作子表。 用于《麻醉术前访视记录》，《手术知情告知书》
Relationship procedures As HCC.SQL.Document.TreatmentPlan.Procedure [ Cardinality = children, Inverse = treatmentPlan ];

/// 拟实施麻醉方法。 用于《麻醉术前访视记录》
Property anesthesia As HCC.SQL.Document.TreatmentPlan.Anesthesia [ SqlFieldName = anesth ];

/// 待产记录部分
Property InLabor As HCC.SQL.Document.TreatmentPlan.InLabor [ SqlFieldName = inlabor ];

/// 替代方案
Property procedureSubtitude As WS.DE.DE060030100 [ SqlFieldName = procd_subst ];

/// 输血过程
Property bloodTransfusion As HCC.SQL.Document.TreatmentPlan.BloodTransfusion [ SqlFieldName = blood_trans ];

/// 特殊检查及特殊治疗项目
Property specialTreatment As HCC.SQL.Document.TreatmentPlan.SpecialTreatment [ SqlFieldName = spec_treat ];

/// 诊疗计划。用于《首次病程记录》
Property carePlan As WS.DE.DE050102500 [ SqlFieldName = care_plan ];

/// 诊疗计划。《交接班记录》-接班诊疗计划、《转科记录》
Property shiftPlan As WS.DE.DE060029800 [ SqlFieldName = shift_plan ];

/// 注意事项。《交接班记录》、《转科记录》
Property caution As WS.DE.DE090011900 [ SqlFieldName = caution ];

/// 诊疗过程名称。《会诊记录》
Property treatmentProcess As WS.DE.DE060029700 [ SqlFieldName = treatment_proc ];

/// 会诊目的。《会诊记录》
Property consultPurpose As WS.DE.DE060021400 [ SqlFieldName = consult_purp ];

Storage Default
{
<Data name="TreatmentPlanDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>readmission</Value>
</Value>
<Value name="3">
<Value>readmissionReason</Value>
</Value>
<Value name="4">
<Value>differentiationBasis</Value>
</Value>
<Value name="5">
<Value>treatmentPrinciple</Value>
</Value>
<Value name="6">
<Value>notes</Value>
</Value>
<Value name="7">
<Value>guide</Value>
</Value>
<Value name="8">
<Value>plan</Value>
</Value>
<Value name="9">
<Value>followup</Value>
</Value>
<Value name="10">
<Value>procedure</Value>
</Value>
<Value name="11">
<Value>anesthesia</Value>
</Value>
<Value name="12">
<Value>InLabor</Value>
</Value>
<Value name="13">
<Value>procedureSubtitude</Value>
</Value>
<Value name="14">
<Value>bloodTransfusion</Value>
</Value>
<Value name="15">
<Value>specialTreatment</Value>
</Value>
<Value name="16">
<Value>carePlan</Value>
</Value>
<Value name="17">
<Value>differentiationNotes</Value>
</Value>
<Value name="18">
<Value>shiftPlan</Value>
</Value>
<Value name="19">
<Value>caution</Value>
</Value>
<Value name="20">
<Value>transferReason</Value>
</Value>
<Value name="21">
<Value>treatmentProcess</Value>
</Value>
<Value name="22">
<Value>consultPurpose</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Docu70F6.TreatmentPlanD</DataLocation>
<DefaultData>TreatmentPlanDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.TreatmentPlanD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.TreatmentPlanI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.TreatmentPlanS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
