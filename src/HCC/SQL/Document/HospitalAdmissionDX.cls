/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 入院诊断章节表
Class HCC.SQL.Document.HospitalAdmissionDX Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "46241-6";

Parameter SectionName = "HOSPITAL ADMISSION DX";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 入院情况。用于《交接班记录》、《转科记录》
Property admitCondition As WS.DE.DE051014800 [ SqlFieldName = admit_cond ];

/// 诊断依据。用于 《术前小结》
Property diagBasis As WS.DE.DE050107000 [ SqlFieldName = diag_basis ];

/// 西医诊断子表
Relationship Diagnoses As HCC.SQL.Document.HospitalAdmissionDX.Diagnosis [ Cardinality = children, Inverse = HospitalAdmissionDX ];

/// 中医诊断子表
Relationship TCMs As HCC.SQL.Document.HospitalAdmissionDX.TCM [ Cardinality = children, Inverse = HospitalAdmissionDX ];

/// 阳性辅助检查结果子表。用于《出院记录》
Relationship AuxExamResults As HCC.SQL.Document.HospitalAdmissionDX.AuxExamResult [ Cardinality = children, Inverse = HospitalAdmissionDX ];

/// 入院日期时间。用于《出院记录》
Property admitTime As WS.DE.DE060009200 [ SqlFieldName = admit_time ];

/// 中医“四诊”观察结果。用于《出院记录》
Property TCMObservation As WS.DE.DE021002800 [ SqlFieldName = TCM_obs ];

/// 治则治法。用于《出院记录》
Property treatmentPrinciple As WS.DE.DE060030000 [ SqlFieldName = treat_prin ];

Storage Default
{
<Data name="HospitalAdmissionDXDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diagnosisCode</Value>
</Value>
<Value name="3">
<Value>admitCondition</Value>
</Value>
<Value name="4">
<Value>diagBasis</Value>
</Value>
<Value name="5">
<Value>admitTime</Value>
</Value>
<Value name="6">
<Value>TCMObservation</Value>
</Value>
<Value name="7">
<Value>treatmentPrinciple</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.HospitalAdmFB9AD</DataLocation>
<DefaultData>HospitalAdmissionDXDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HospitalAdmFB9AD</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.HospitalAdmFB9AI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.HospitalAdmFB9AS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
