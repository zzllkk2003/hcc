/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 辅助检查条目表
/// 注意，这不是章节类，是辅助检查条目类。不需要辅助检查章节类
Class HCC.SQL.Document.SupplementaryExam Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "辅助检查";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = SupplementaryExams ];

/// 辅助检查结果
Property result As WS.DE.DE043000900 [ SqlFieldName = result ];

Storage Default
{
<Data name="SupplementaryExamDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>result</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("SupplementaryExams")</DataLocation>
<DefaultData>SupplementaryExamDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentC("SupplementaryExams")</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.Supplementa2299I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.Supplementa2299S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
