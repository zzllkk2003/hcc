/// Author: QP
/// Version: 1.0
/// Date:2021/07/08
/// 失血章节表
Class HCC.SQL.Document.BloodLoss Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "55103-6";

Parameter SectionName = "Surgical operation note estimated blood loss";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 手术出血量
Property volume As WS.DE.DE060009700 [ SqlFieldName = vol ];

Storage Default
{
<Data name="BloodLossDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>volume</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.BloodLossD</DataLocation>
<DefaultData>BloodLossDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.BloodLossD</IdLocation>
<IndexLocation>^HCC.SQL.Document.BloodLossI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.BloodLossS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
