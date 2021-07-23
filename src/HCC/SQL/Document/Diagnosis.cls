/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 诊断记录章节
Class HCC.SQL.Document.Diagnosis Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(ukDocNo);

/// 门急诊诊断
Relationship Outpatients As HCC.SQL.Document.Diagnosis.Outpatient [ Cardinality = children, Inverse = Diagnosis ];

/// 病理诊断
Relationship Pathologys As HCC.SQL.Document.Diagnosis.Pathology [ Cardinality = children, Inverse = Diagnosis ];

Storage Default
{
<Data name="DiagnosisDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
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
