/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 中医症候子表
Class HCC.SQL.Document.Diagnosis.TCMSyndrome Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 中医症候
Property syndrome As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = syndrome ];

/// 文档编号
Relationship Diagnosis As HCC.SQL.Document.Diagnosis [ Cardinality = parent, Inverse = TCMSyndrome, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="TCMSyndromeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diagnosisName</Value>
</Value>
<Value name="3">
<Value>diagnosisCode</Value>
</Value>
<Value name="4">
<Value>Syndrome</Value>
</Value>
<Value name="5">
<Value>syndrome</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("TCMSyndrome")</DataLocation>
<DefaultData>TCMSyndromeDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DiagnosisC("TCMSyndrome")</IdLocation>
<IndexLocation>^HCC.SQL.DocumeA237.TCMSyndromeI</IndexLocation>
<StreamLocation>^HCC.SQL.DocumeA237.TCMSyndromeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
