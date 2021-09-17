/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 月经史章节
/// 涵盖《病历概要》
Class HCC.SQL.Document.MenstrualHistory Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "49033-4";

Parameter SectionName = "Menstrual History";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 月经史
Property menstrual As WS.DE.DE021010200 [ SqlFieldName = menstrual ];

Storage Default
{
<Data name="MenstrualHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>menstrual</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.MenstrualHi572FD</DataLocation>
<DefaultData>MenstrualHistoryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.MenstrualHi572FD</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.MenstrualHi572FI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.MenstrualHi572FS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
