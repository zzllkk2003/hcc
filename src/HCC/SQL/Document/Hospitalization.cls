/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 住院史章节
Class HCC.SQL.Document.Hospitalization Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(ukDocNo);

/// 住院次数数值
Property hospitalizationCount As WS.DE.DE021009000 [ SqlFieldName = hospitalization_count ];

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
