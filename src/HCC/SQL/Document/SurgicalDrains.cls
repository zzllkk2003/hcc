/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 引流章节表
Class HCC.SQL.Document.SurgicalDrains Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "11537-8";

Parameter SectionName = "Surgical drains";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 引流标志
Property drains As WS.DE.DE051016500 [ SqlFieldName = drains ];

/// 引流材料名称
Property material As WS.DE.DE085004400 [ SqlFieldName = material ];

/// 引流材料数目
Property count As WS.DE.DE085004500 [ SqlFieldName = count ];

/// 放置部位
Property Position As WS.DE.DE060034100 [ SqlFieldName = body_pos ];

Storage Default
{
<Data name="SurgicalDrainsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>drains</Value>
</Value>
<Value name="3">
<Value>material</Value>
</Value>
<Value name="4">
<Value>count</Value>
</Value>
<Value name="5">
<Value>Position</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Doc70F6.SurgicalDrainsD</DataLocation>
<DefaultData>SurgicalDrainsDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Doc70F6.SurgicalDrainsD</IdLocation>
<IndexLocation>^HCC.SQL.Doc70F6.SurgicalDrainsI</IndexLocation>
<StreamLocation>^HCC.SQL.Doc70F6.SurgicalDrainsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
