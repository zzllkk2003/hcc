/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 个人史/社会史章节
Class HCC.SQL.Document.SocialHistory Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "29762-2";

Parameter SectionName = "Social history";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

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
<DataLocation>^HCC.SQL.Docu70F6.SocialHistoryD</DataLocation>
<DefaultData>SocialHistoryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.SocialHistoryD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.SocialHistoryI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.SocialHistoryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
