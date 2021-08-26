/// 互联互通文档头子表 - 就诊场景子表 - 病床、病房、病区与科室子表
Class HCC.SQL.Document.Header.EncompassingEncounter.Location Extends (%Persistent, %XML.Adaptor)
{

/// 病床标识
Property bedId As %String [ SqlFieldName = bed_id ];

/// 病床号
Property bedNum As WS.DE.DE010002600 [ SqlFieldName = bed_num ];

/// 病房标识
Property wardId As %String [ SqlFieldName = ward_id ];

/// 病房号
Property wardName As WS.DE.DE010001900 [ SqlFieldName = ward_name ];

/// 病区标识
Property areaId As %String [ SqlFieldName = area_id ];

/// 病区名称
Property areaName As WS.DE.DE081005400 [ SqlFieldName = area_name ];

/// 科室标识
Property deptId As %String [ SqlFieldName = dept_id ];

/// 科室名称
Property deptName As WS.DE.DE081002600 [ Required, SqlFieldName = dept_name ];

/// 医院标识
Property hosId As %String [ InitialExpression = {$lg(^HCC("HostFacility"),1)}, SqlFieldName = hos_id ];

/// 医院名称
Property hosName As %String [ InitialExpression = {$lg(^HCC("HostFacility"),2)}, SqlFieldName = hos_name ];

/// 文档编号
Relationship Encounter As HCC.SQL.Document.Header.EncompassingEncounter [ Cardinality = parent, Inverse = Locations, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="LocationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>bedNum</Value>
</Value>
<Value name="3">
<Value>wardId</Value>
</Value>
<Value name="4">
<Value>wardName</Value>
</Value>
<Value name="5">
<Value>areaId</Value>
</Value>
<Value name="6">
<Value>areaName</Value>
</Value>
<Value name="7">
<Value>deptId</Value>
</Value>
<Value name="8">
<Value>deptName</Value>
</Value>
<Value name="9">
<Value>hosId</Value>
</Value>
<Value name="10">
<Value>hosName</Value>
</Value>
<Value name="11">
<Value>bedId</Value>
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
