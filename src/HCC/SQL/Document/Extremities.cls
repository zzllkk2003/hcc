/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 四肢章节表
Class HCC.SQL.Document.Extremities Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "10196-4";

Parameter SectionName = "EXTREMITIES";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 足背动脉搏动标志
Property arteriaDorsalPedisPulse As WS.DE.DE041023700 [ SqlFieldName = adpp ];

Storage Default
{
<Data name="ExtremitiesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>arteriaDorsalPedisPulse</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.ExtremitiesD</DataLocation>
<DefaultData>ExtremitiesDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.ExtremitiesD</IdLocation>
<IndexLocation>^HCC.SQL.Document.ExtremitiesI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.ExtremitiesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
