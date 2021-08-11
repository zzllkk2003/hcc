/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 住院史章节表
Class HCC.SQL.Document.Hospitalization Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "11336-5";

Parameter SectionName = "HISTORY OF HOSPITALIZATIONS";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 住院次数数值
Property hospitalizationCount As WS.DE.DE021009000 [ SqlFieldName = hospt_count ];

Storage Default
{
<Data name="HospitalizationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>hospitalizationCount</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.HospitalizaFDC4D</DataLocation>
<DefaultData>HospitalizationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HospitalizaFDC4D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.HospitalizaFDC4I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.HospitalizaFDC4S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
