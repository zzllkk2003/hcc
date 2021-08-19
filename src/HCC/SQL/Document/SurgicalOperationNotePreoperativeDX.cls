/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 术前诊断章节表
Class HCC.SQL.Document.SurgicalOperationNotePreoperativeDX Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "10219-4";

Parameter SectionName = "Surgical operation note preoperative Dx";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 疾病诊断
Property diagnosisCode As WS.DE.DE050102400 [ SqlFieldName = diag_code ];

/// 诊断依据
Property basis As WS.DE.DE050107000 [ SqlFieldName = basis ];

/// 入院日期时间
Property admitTime As WS.DE.DE060009200 [ SqlFieldName = admit_time ];

Relationship Items As HCC.SQL.Document.SurgOperNotePreoperativeDX.Item [ Cardinality = children, Inverse = Diagnosis ];

Storage Default
{
<Data name="SurgicalOperationNotePreoperativeDXDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diagnosisCode</Value>
</Value>
<Value name="3">
<Value>basis</Value>
</Value>
<Value name="4">
<Value>admitTime</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.SurgicalOpe1CCCD</DataLocation>
<DefaultData>SurgicalOperationNotePreoperativeDXDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.SurgicalOpe1CCCD</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.SurgicalOpe1CCCI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.SurgicalOpe1CCCS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
