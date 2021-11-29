/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 互联互通文档头子表-就诊场景表
Class HCC.SQL.Document.Header.EncompassingEncounter Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 入院途径
Property admissionCode As WS.DE.DE060033900 [ Required, SqlFieldName = admission_code ];

/// 就诊时间 - 入院日期
Property effectiveTimeLow As WS.DE.DE060009200 [ Required, SqlFieldName = admit_time ];

/// 就诊时间 - 出院日期
Property effectiveTimeHigh As WS.DE.DE060001700 [ Required, SqlFieldName = discharge_time ];

Relationship Locations As HCC.SQL.Document.Header.EncompassingEncounter.Location(XMLNIL = 0) [ Cardinality = children, Inverse = Encounter ];

Storage Default
{
<Data name="EncompassingEncounterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>admissionCode</Value>
</Value>
<Value name="3">
<Value>effectiveTimeLow</Value>
</Value>
<Value name="4">
<Value>effectiveTimeHigh</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.DoEBE5.Encompassin61B1D</DataLocation>
<DefaultData>EncompassingEncounterDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DoEBE5.Encompassin61B1D</IdLocation>
<IndexLocation>^HCC.SQL.DoEBE5.Encompassin61B1I</IndexLocation>
<StreamLocation>^HCC.SQL.DoEBE5.Encompassin61B1S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
