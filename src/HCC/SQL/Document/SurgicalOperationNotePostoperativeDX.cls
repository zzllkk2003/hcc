/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 术后诊断章节表
Class HCC.SQL.Document.SurgicalOperationNotePostoperativeDX Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "10218-6";

Parameter SectionName = "Surgical operation note postoperative Dx";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 疾病诊断
Property code As WS.DE.DE050102400 [ Required, SqlFieldName = code ];

/// 诊断名称。用于《术后首次病程记录》
Property name As WS.DE.DE050102500 [ Required, SqlFieldName = name ];

/// 诊断依据。用于《术后首次病程记录》
Property basis As WS.DE.DE050107000 [ Required, SqlFieldName = basis ];

Storage Default
{
<Data name="SurgicalOperationNotePostoperativeDXDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diagnosisCode</Value>
</Value>
<Value name="3">
<Value>code</Value>
</Value>
<Value name="4">
<Value>name</Value>
</Value>
<Value name="5">
<Value>basis</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.SurgicalOpeB842D</DataLocation>
<DefaultData>SurgicalOperationNotePostoperativeDXDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.SurgicalOpeB842D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.SurgicalOpeB842I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.SurgicalOpeB842S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
