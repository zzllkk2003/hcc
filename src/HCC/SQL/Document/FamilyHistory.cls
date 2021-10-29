/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 家族史章节条目
/// 注意，这不是章节类，是家族史元素类。不需要家族史章节类
Class HCC.SQL.Document.FamilyHistory Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "10157-6";

Parameter SectionName = "HISTORY OF FAMILY MEMBER DISEASES";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = FamilyHistories ];

/// 家族史
Property code As WS.DE.DE021010300;

Storage Default
{
<Data name="FamilyHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("IllnessHistories")</DataLocation>
<DefaultData>FamilyHistoryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentC("IllnessHistories")</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.FamilyHistoryI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.FamilyHistoryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
