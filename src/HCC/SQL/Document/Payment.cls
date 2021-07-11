/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 费用章节
Class HCC.SQL.Document.Payment Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(ukDocNo);

/// 医疗费用支付方式代码
Property paymentWay As WS.DE.DE070000700 [ SqlFieldName = payment_way ];

/*
/// 住院总费用
Property totalFee As WS.DE.DE070001000 [ SqlFieldName = total ];

/// 住院总费用-自付金额
Property patientPay As WS.DE.DE070001000 [ SqlFieldName = patient_pay ];

/// 综合医疗服务费-一般医疗服务费
Property generalService As WS.DE.DE070001000 [ SqlFieldName = general_service ];

/// 综合医疗服务费-一般治疗操作费
Property generalTreatment As WS.DE.DE070001000 [ SqlFieldName = general_treatment ];

/// 综合医疗服务费-护理费
Property generalNurse As WS.DE.DE070001000 [ SqlFieldName = general_nurse ];

/// 综合医疗服务费-其他费用
Property generalOther As WS.DE.DE070001000 [ SqlFieldName = general_other ];

/// 诊断-病理诊断费
Property diagPathology As WS.DE.DE070001000 [ SqlFieldName = diag_pathology ];

/// 诊断-实验室诊断费
Property diagLab As WS.DE.DE070001000 [ SqlFieldName = diag_lab ];

/// 诊断-影像学诊断费
Property diagImage As WS.DE.DE070001000 [ SqlFieldName = diag_image ];

/// 诊断-临床诊断项目费
Property diagDiagnosis As WS.DE.DE070001000 [ SqlFieldName = diag_diagnosis ];

/// 治疗-非手术治疗项目费
Property treatmentNonSurgery As WS.DE.DE070001000 [ SqlFieldName = treatment_nonSurgery ];

/// 治疗-非手术治疗项目费-临床物理治疗费
Property treatmentPhysical As WS.DE.DE070001000 [ SqlFieldName = treatment_physical ];

/// 治疗-手术治疗费
Property treatmentSurgery As WS.DE.DE070001000 [ SqlFieldName = treatment_surgery ];

/// 治疗-手术治疗费-麻醉费
Property treatmentAnesthesia As WS.DE.DE070001000 [ SqlFieldName = treatment_anesthesia ];

/// 治疗-手术治疗费-手术费
Property treatmentSurgeryOperation As WS.DE.DE070001000 [ SqlFieldName = treatment_surgery_operation ];

/// 康复费类服务费
Property rehabilitation As WS.DE.DE070001000 [ SqlFieldName = rehabilitation ];

/// 中医治疗费
Property TCMTreatment As WS.DE.DE070001000 [ SqlFieldName = TCM_treatment ];

/// 西药费
Property Medicine As WS.DE.DE070001000 [ SqlFieldName = medicine ];

/// 西药费 - 抗菌药物费用
Property MedicineAntibacterial As WS.DE.DE070001000 [ SqlFieldName = antibacterial ];

/// 中药费 - 中成药费
Property TCMPatent As WS.DE.DE070001000 [ SqlFieldName = TCM_patent ];

/// 中药费 - 中草药费
Property TCMHerb As WS.DE.DE070001000 [ SqlFieldName = TCM_herb ];

/// 血费 
Property Blood As WS.DE.DE070001000 [ SqlFieldName = blood ];

/// 白蛋白类制品费 
Property albumin As WS.DE.DE070001000 [ SqlFieldName = albumin ];

/// 球蛋白类制品费 
Property globulin As WS.DE.DE070001000 [ SqlFieldName = globulin ];

/// 凝血因子类制品费 
Property clotfactor As WS.DE.DE070001000 [ SqlFieldName = clotfactor ];

/// 细胞因子类制品费 
Property cellfactor As WS.DE.DE070001000 [ SqlFieldName = cellfactor ];

/// 耗材-一次性医用材料费-检查用 
Property consumableExam As WS.DE.DE070001000 [ SqlFieldName = consumable_exam ];

/// 耗材-一次性医用材料费-治疗用 
Property consumableTreatment As WS.DE.DE070001000 [ SqlFieldName = consumable_treamtment ];

/// 耗材-一次性医用材料费-手术用 
Property consumableSurgery As WS.DE.DE070001000 [ SqlFieldName = consumable_surgery ];
*/
/// 住院总费用
Property totalFee As HCC.SQL.Document.Payment.Total;

/// 综合医疗服务费
Property generalFee As HCC.SQL.Document.Payment.General;

/// 诊断费
Property diagFee As HCC.SQL.Document.Payment.Diag;

/// 治疗费
Property treatmentFee As HCC.SQL.Document.Payment.Treatment;

/// 康复费类服务费
Property rehabilitationFee As WS.DE.DE070001000 [ SqlFieldName = rehabilitation ];

/// 中医治疗费
Property TCMTreatmentFee As WS.DE.DE070001000 [ SqlFieldName = TCM_treatment ];

/// 西药费
Property medicineFee As HCC.SQL.Document.Payment.Medicine;

/// 中药费
Property TCMFee As HCC.SQL.Document.Payment.TCM;

/// 血费
Property bloodFee As HCC.SQL.Document.Payment.Blood;

/// 耗材
Property consumableFee As HCC.SQL.Document.Payment.Consumable;

/// 其他费 
Property otherFee As WS.DE.DE070001000 [ SqlFieldName = other ];

Storage Default
{
<Data name="PaymentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>paymentWay</Value>
</Value>
<Value name="3">
<Value>total</Value>
</Value>
<Value name="4">
<Value>patientPay</Value>
</Value>
<Value name="5">
<Value>generalService</Value>
</Value>
<Value name="6">
<Value>generalTreatment</Value>
</Value>
<Value name="7">
<Value>generalNurse</Value>
</Value>
<Value name="8">
<Value>generalOther</Value>
</Value>
<Value name="9">
<Value>diagPathology</Value>
</Value>
<Value name="10">
<Value>diagLab</Value>
</Value>
<Value name="11">
<Value>diagImage</Value>
</Value>
<Value name="12">
<Value>diagDiagnosis</Value>
</Value>
<Value name="13">
<Value>treatmentNonSurgery</Value>
</Value>
<Value name="14">
<Value>treatmentPhysical</Value>
</Value>
<Value name="15">
<Value>treatmentSurgery</Value>
</Value>
<Value name="16">
<Value>treatmentAnesthesia</Value>
</Value>
<Value name="17">
<Value>treatmentSurgeryOperation</Value>
</Value>
<Value name="18">
<Value>rehabilitation</Value>
</Value>
<Value name="19">
<Value>TCMTreatment</Value>
</Value>
<Value name="20">
<Value>Medicine</Value>
</Value>
<Value name="21">
<Value>MedicineAntibacterial</Value>
</Value>
<Value name="22">
<Value>TCMPatent</Value>
</Value>
<Value name="23">
<Value>TCMHerb</Value>
</Value>
<Value name="24">
<Value>Blood</Value>
</Value>
<Value name="25">
<Value>albumin</Value>
</Value>
<Value name="26">
<Value>globulin</Value>
</Value>
<Value name="27">
<Value>clotfactor</Value>
</Value>
<Value name="28">
<Value>cellfactor</Value>
</Value>
<Value name="29">
<Value>consumableExam</Value>
</Value>
<Value name="30">
<Value>consumableTreatment</Value>
</Value>
<Value name="31">
<Value>consumableSurgery</Value>
</Value>
<Value name="32">
<Value>other</Value>
</Value>
<Value name="33">
<Value>general</Value>
</Value>
<Value name="34">
<Value>treatment</Value>
</Value>
<Value name="35">
<Value>TCM</Value>
</Value>
<Value name="36">
<Value>medicine</Value>
</Value>
<Value name="37">
<Value>blood</Value>
</Value>
<Value name="38">
<Value>diag</Value>
</Value>
<Value name="39">
<Value>consumable</Value>
</Value>
<Value name="40">
<Value>bloodFee</Value>
</Value>
<Value name="41">
<Value>medicineFee</Value>
</Value>
<Value name="42">
<Value>generalFee</Value>
</Value>
<Value name="43">
<Value>diagFee</Value>
</Value>
<Value name="44">
<Value>treatmentFee</Value>
</Value>
<Value name="45">
<Value>rehabilitationFee</Value>
</Value>
<Value name="46">
<Value>TCMTreatmentFee</Value>
</Value>
<Value name="47">
<Value>TCMFee</Value>
</Value>
<Value name="48">
<Value>consumableFee</Value>
</Value>
<Value name="49">
<Value>otherFee</Value>
</Value>
<Value name="50">
<Value>totalFee</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.PaymentD</DataLocation>
<DefaultData>PaymentDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.PaymentD</IdLocation>
<IndexLocation>^HCC.SQL.Document.PaymentI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.PaymentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
