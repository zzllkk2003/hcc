/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 输液章节表
Class HCC.SQL.Document.Infusion Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "10216-0";

Parameter SectionName = "Surgical operation note fluids";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 输液量
Property volume As WS.DE.DE060026800 [ SqlFieldName = vol ];

/// 术中输液项目。用于《麻醉记录》
Property item As WS.DE.DE060026900 [ SqlFieldName = item ];

Storage Default
{
<Data name="InfusionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>volume</Value>
</Value>
<Value name="3">
<Value>item</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.InfusionD</DataLocation>
<DefaultData>InfusionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.InfusionD</IdLocation>
<IndexLocation>^HCC.SQL.Document.InfusionI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.InfusionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
