/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 诊断记录章节表
Class HCC.SQL.Document.Diagnosis Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
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

/// 诊断依据。用于《首次病程记录》的"诊断记录章节"
Property basis As WS.DE.DE050107000 [ SqlFieldName = basis ];

/// 病例特点。用于《首次病程记录》的"诊断记录章节"
Property caseCharacteristics As WS.DE.DE051013300 [ SqlFieldName = case_char ];

/// 中医四诊观察结果子表
Relationship TCMFourDiags As HCC.SQL.Document.Diagnosis.TCMFourDiagnostic [ Cardinality = children, Inverse = Diagnosis ];

/// 西医诊断子表
Relationship Westerns As HCC.SQL.Document.Diagnosis.Western [ Cardinality = children, Inverse = Diagnosis ];

/// 病理诊断子表
Relationship Pathologys As HCC.SQL.Document.Diagnosis.Pathology [ Cardinality = children, Inverse = Diagnosis ];

/// 中医诊断子表
Relationship TCM As HCC.SQL.Document.Diagnosis.TCM [ Cardinality = children, Inverse = Diagnosis ];

/// 中医症候子表
Relationship TCMSyndrome As HCC.SQL.Document.Diagnosis.TCMSyndrome [ Cardinality = children, Inverse = Diagnosis ];

/// 死亡诊断子表
Relationship Deaths As HCC.SQL.Document.Diagnosis.Death [ Cardinality = children, Inverse = Diagnosis ];

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
<Value>situation</Value>
</Value>
<Value name="4">
<Value>situationChange</Value>
</Value>
<Value name="5">
<Value>basis</Value>
</Value>
<Value name="6">
<Value>caseCharacteristics</Value>
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
