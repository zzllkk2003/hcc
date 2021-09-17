/// 预防接种史章节条目表
Class HCC.SQL.Document.Vaccination Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "11369-6";

Parameter SectionName = "HISTORY OFIMMUNIZATIONS";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Vaccinations ];

/// 预防接种史条目名称
Property name As WS.DE.DE021010100 [ SqlFieldName = name ];

Storage Default
{
<Data name="VaccinationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Vaccinations")</DataLocation>
<DefaultData>VaccinationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentC("Vaccinations")</IdLocation>
<IndexLocation>^HCC.SQL.Document.VaccinationI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.VaccinationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
