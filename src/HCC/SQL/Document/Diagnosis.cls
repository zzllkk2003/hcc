/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 诊断记录章节表
Class HCC.SQL.Document.Diagnosis Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "29548-5";

Parameter SectionName = "Diagnosis";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 初诊标志。用于《门急诊病历》的"诊断记录章节"
Property firstVisit As WS.DE.DE060019600 [ SqlFieldName = first_visit ];

/// 目前情况。用于《交接班记录》、《转科记录》的"诊断记录章节"
Property situation As WS.DE.DE060018400 [ SqlFieldName = situ ];

/// 病情变化情况。用于《抢救记录》
Property situationChange As WS.DE.DE051013400 [ SqlFieldName = situ_change ];

/// 中医四诊观察结果。用于《门急诊病历》、《交接班记录》的"诊断记录章节"
Property TCMFourDiagnostic As WS.DE.DE020102800 [ SqlFieldName = TCM_four_diag ];

/// 西医诊断子表
Relationship Diagnoses As HCC.SQL.Document.Diagnosis.Diagnosis [ Cardinality = children, Inverse = Diagnosis ];

/// 病理诊断子表
Relationship Pathologys As HCC.SQL.Document.Diagnosis.Pathology [ Cardinality = children, Inverse = Diagnosis ];

/// 中医诊断子表。用于《门急诊病历》、《中药处方》的"诊断记录章节"
Relationship TCM As HCC.SQL.Document.Diagnosis.TCM [ Cardinality = children, Inverse = Diagnosis ];

/// 中医症候子表。用于《门急诊病历》、《中药处方》的"诊断记录章节"
Relationship TCMSyndrome As HCC.SQL.Document.Diagnosis.TCMSyndrome [ Cardinality = children, Inverse = Diagnosis ];

/// 病例特点。用于《首次病程记录》的"诊断记录章节"
Property caseCharacteristics As WS.DE.DE051013300 [ SqlFieldName = case_char ];

/// 诊断依据。用于《首次病程记录》的"诊断记录章节"
Property basis As WS.DE.DE050107000 [ SqlFieldName = basis ];

/// 初步诊断-西医诊断编码。用于《首次病程记录》的"诊断记录章节"
Property preliminaryDiag As WS.DE.DE050102400 [ SqlFieldName = prelim_diag ];

/// 初步诊断-中医病名代码。用于《首次病程记录》的"诊断记录章节"
Property preliminaryTCMDiag As WS.DE.DE050107000 [ SqlFieldName = prelim_TCM_diag ];

/// 初步诊断-中医症候代码。用于《首次病程记录》的"诊断记录章节"
Property preliminarySyndrome As WS.DE.DE051013000 [ SqlFieldName = prelim_syndrome ];

/// 鉴别诊断-西医诊断名称。用于《首次病程记录》的"诊断记录章节"
Property differentialDiag As WS.DE.DE050102500 [ SqlFieldName = diff_diag ];

/// 鉴别诊断-中医病名名称。用于《首次病程记录》的"诊断记录章节"
Property differentialTCMDiag As WS.DE.DE051017200 [ SqlFieldName = diff_TCM_diag ];

/// 鉴别诊断-中医症候名称。用于《首次病程记录》的"诊断记录章节"
Property differentialSyndrome As WS.DE.DE051017200 [ SqlFieldName = diff_syndrome ];

/// 死亡诊断名称。用于《死亡病例讨论记录》的"诊断记录章节"
Property deathDiag As WS.DE.DE050102500 [ SqlFieldName = death_diag ];

/// 死亡诊断编码。用于《死亡病例讨论记录》的"诊断记录章节"
Property deathDiagCode As WS.DE.DE050102100 [ SqlFieldName = death_diag_code ];

Storage Default
{
<Data name="DiagnosisDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>firstVisit</Value>
</Value>
<Value name="3">
<Value>TCMFourDiagnostic</Value>
</Value>
<Value name="4">
<Value>caseCharacteristics</Value>
</Value>
<Value name="5">
<Value>basis</Value>
</Value>
<Value name="6">
<Value>preliminaryDiag</Value>
</Value>
<Value name="7">
<Value>preliminaryTCMDiag</Value>
</Value>
<Value name="8">
<Value>preliminarySyndrome</Value>
</Value>
<Value name="9">
<Value>differentialDiag</Value>
</Value>
<Value name="10">
<Value>differentialTCMDiag</Value>
</Value>
<Value name="11">
<Value>differentialSyndrome</Value>
</Value>
<Value name="12">
<Value>situation</Value>
</Value>
<Value name="13">
<Value>situationChange</Value>
</Value>
<Value name="14">
<Value>deathDiag</Value>
</Value>
<Value name="15">
<Value>deathDiagCode</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.DiagnosisD</DataLocation>
<DefaultData>DiagnosisDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DiagnosisD</IdLocation>
<IndexLocation>^HCC.SQL.Document.DiagnosisI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.DiagnosisS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
