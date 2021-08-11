/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 病历摘要章节表
Class HCC.SQL.Document.MRSummary Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "DE06.00.182.00";

Parameter SectionName = "病历摘要章节";

Parameter SectionCodeSystemOID = "2.16.156.10011.2.2.1";

Parameter SectionCodeSystem = "卫生信息数据元目录";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 病历摘要
Property content As WS.DE.DE060018200 [ SqlFieldName = content ];

Storage Default
{
<Data name="MRSummaryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>content</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.MRSummaryD</DataLocation>
<DefaultData>MRSummaryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.MRSummaryD</IdLocation>
<IndexLocation>^HCC.SQL.Document.MRSummaryI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.MRSummaryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
