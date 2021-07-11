/// 就诊场景 - 科室与病房
Class HCC.SQL.Document.Header.EncompassingEncounter.Location Extends (%Persistent, %XML.Adaptor)
{

/// 病房号标识
Property wholeOrganizationId As %String [ Required, SqlFieldName = wholeOrganization_id ];

/// 病房号
Property wholeOrganizationName As WS.DE.DE010001900 [ Required, SqlFieldName = wholeOrganization_name ];

/// 科室名称标识
Property asOrganizationPartOfId As %String [ Required, SqlFieldName = asOrganizationPartOf_id ];

/// 科室名称
Property asOrganizationPartOfName As WS.DE.DE081002600 [ Required, SqlFieldName = asOrganizationPartOf_name ];

Relationship Encounter As HCC.SQL.Document.Header.EncompassingEncounter [ Cardinality = parent, Inverse = Locations ];

Storage Default
{
<Data name="LocationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>wholeOrganizationId</Value>
</Value>
<Value name="3">
<Value>wholeOrganizationName</Value>
</Value>
<Value name="4">
<Value>asOrganizationPartOfId</Value>
</Value>
<Value name="5">
<Value>asOrganizationPartOfName</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Locations")</DataLocation>
<DefaultData>LocationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DoEBE5.Encompassin61B1C("Locations")</IdLocation>
<IndexLocation>^HCC.SQL.Document9BCB.LocationI</IndexLocation>
<StreamLocation>^HCC.SQL.Document9BCB.LocationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
