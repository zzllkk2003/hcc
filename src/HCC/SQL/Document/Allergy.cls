/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 过敏史章节表
Class HCC.SQL.Document.Allergy Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "48765-2";

Parameter SectionName = "Allergies, adverse reactions, alerts";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 过敏条目
Relationship Allergies As HCC.SQL.Document.Allergy.Item [ Cardinality = children, Inverse = Allergy ];

/// 过敏史标志，标记患者是否有过敏史
Property active As WS.DE.DE021002300 [ SqlFieldName = active ];

Storage Default
{
<Data name="AllergyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>active</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.AllergyD</DataLocation>
<DefaultData>AllergyDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.AllergyD</IdLocation>
<IndexLocation>^HCC.SQL.Document.AllergyI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.AllergyS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
