/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 讨论内容章节表
Class HCC.SQL.Document.Discussion Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "DE06.00.181.00";

Parameter SectionName = "死亡讨论记录";

Parameter SectionCodeSystemOID = "2.16.156.10011.2.2.1";

Parameter SectionCodeSystem = "卫生信息数据元目录";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 死亡讨论记录
Property content As WS.DE.DE060018100 [ SqlFieldName = content ];

Storage Default
{
<Data name="DiscussionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>content</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.DiscussionD</DataLocation>
<DefaultData>DiscussionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DiscussionD</IdLocation>
<IndexLocation>^HCC.SQL.Document.DiscussionI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.DiscussionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
