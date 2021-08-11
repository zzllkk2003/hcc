/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 个人史/社会史章节条目
/// 注意，这不是章节类，是社会史条目类，不需要社会史章节类
Class HCC.SQL.Document.SocialHistory Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "29762-2";

Parameter SectionName = "Social history";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = SocialHistories ];

/// 社会史
Property code As WS.DE.DE021009700;

Storage Default
{
<Data name="SocialHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("VaccinationHistories")</DataLocation>
<DefaultData>SocialHistoryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentC("VaccinationHistories")</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.SocialHistoryI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.SocialHistoryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
