/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 费用章节表
Class HCC.SQL.Document.Payment Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "48768-6";

Parameter SectionName = "PAYMENT SOURCES";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 医疗费用支付方式代码
Property paymentWay As WS.DE.DE070000700 [ SqlFieldName = payment_way ];

/// 住院总费用
Property totalFee As HCC.SQL.Document.Payment.Total [ SqlFieldName = total ];

/// 综合医疗服务费
Property generalFee As HCC.SQL.Document.Payment.General [ SqlFieldName = gen ];

/// 诊断费
Property diagFee As HCC.SQL.Document.Payment.Diag [ SqlFieldName = diag ];

/// 治疗费
Property treatmentFee As HCC.SQL.Document.Payment.Treatment [ SqlFieldName = treat ];

/// 康复费类服务费
Property rehabilitationFee As WS.HSDE.HDSD0011055 [ SqlFieldName = rehab ];

/// 中医治疗费
Property TCMTreatmentFee As WS.HSDE.HDSD0011136 [ SqlFieldName = TCM_treat ];

/// 西药费
Property medicineFee As HCC.SQL.Document.Payment.Medicine [ SqlFieldName = med ];

/// 中药费
Property TCMFee As HCC.SQL.Document.Payment.TCM [ SqlFieldName = tcm ];

/// 血费
Property bloodFee As HCC.SQL.Document.Payment.Blood [ SqlFieldName = blood ];

/// 耗材
Property consumableFee As HCC.SQL.Document.Payment.Consumable [ SqlFieldName = cons ];

/// 其他费 
Property otherFee As WS.HSDE.HSDB0510130 [ SqlFieldName = other ];

/// 处方药品金额。《西药处方》费用章节特殊需要！！！
Property prescriptionFee As WS.DE.DE070000400 [ SqlFieldName = rx_fee ];

/// 使用中医诊疗设备标志。《中医住院病案首页》费用章节特殊需要！！！
Property TCMEquipment As WS.DE.DE060024400 [ SqlFieldName = TCM_eqp ];

/// 使用医疗机构中药制剂标志。《中医住院病案首页》费用章节特殊需要！！！
Property TCMMedication As WS.DE.DE060024300 [ SqlFieldName = TCM_med ];

/// 使用中医技术标志。《中医住院病案首页》费用章节特殊需要！！！
Property TCMTech As WS.DE.DE060024500 [ SqlFieldName = TCM_tech ];

/// 辨证施护标志。 《中医住院病案首页》费用章节特殊需要！！！
Property TCMSyndrome As WS.DE.DE060018000 [ SqlFieldName = TCM_syndrome ];

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
<Value name="51">
<Value>prescriptionFee</Value>
</Value>
<Value name="52">
<Value>TCMEquipment</Value>
</Value>
<Value name="53">
<Value>TCMMedication</Value>
</Value>
<Value name="54">
<Value>TCMTech</Value>
</Value>
<Value name="55">
<Value>TCMSyndrome</Value>
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
