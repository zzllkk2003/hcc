/// Author: QP
/// Version: 1.0
/// Date:2021/08
/// 《检查报告》的体格检查章节
/// 注意，这是专门用于C0006《检查报告》的体格检查章节，和其它文档的“体格检查章节”不同！！！
Class HCC.SQL.Document.ExamReportPhysicalExam Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "29545-1";

Parameter SectionName = "PHYSICAL EXAMINATION";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 特殊检查标志
Property special As WS.DE.DE020107900;

/// 检查方法名称
Property name As WS.DE.DE021002700;

/// 检查类别
Property type As WS.DE.DE043001800;

/// 检查项目条目子表
Relationship Items As HCC.SQL.Document.ExamReportPhysicalExam.Item [ Cardinality = children, Inverse = PhyChk ];

Storage Default
{
<Data name="ExamReportPhysicalExamDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>special</Value>
</Value>
<Value name="3">
<Value>name</Value>
</Value>
<Value name="4">
<Value>type</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.ExamReportP83A2D</DataLocation>
<DefaultData>ExamReportPhysicalExamDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.ExamReportP83A2D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.ExamReportP83A2I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.ExamReportP83A2S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
