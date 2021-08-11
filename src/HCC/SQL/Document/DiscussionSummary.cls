/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 讨论总结章节表
Class HCC.SQL.Document.DiscussionSummary Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "DE06.00.018.00";

Parameter SectionName = "主持人总结意见";

Parameter SectionCodeSystemOID = "2.16.156.10011.2.2.1";

Parameter SectionCodeSystem = "卫生信息数据元目录";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 主持人总结意见
Property content As WS.DE.DE060001800 [ SqlFieldName = content ];

Storage Default
{
<Data name="DiscussionSummaryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>content</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.DiscussionSB84ED</DataLocation>
<DefaultData>DiscussionSummaryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.DiscussionSB84ED</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.DiscussionSB84EI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.DiscussionSB84ES</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
