/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 主诉章节表
Class HCC.SQL.Document.ChiefComplaint Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "10154-3";

Parameter SectionName = "CHIEF COMPLAINT";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 主诉
Property chiefComplaint As WS.DE.DE040111900 [ SqlFieldName = cc ];

Storage Default
{
<Data name="ChiefComplaintDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>chiefComplaint</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Doc70F6.ChiefComplaintD</DataLocation>
<DefaultData>ChiefComplaintDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Doc70F6.ChiefComplaintD</IdLocation>
<IndexLocation>^HCC.SQL.Doc70F6.ChiefComplaintI</IndexLocation>
<StreamLocation>^HCC.SQL.Doc70F6.ChiefComplaintS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
