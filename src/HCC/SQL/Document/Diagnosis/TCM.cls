/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 中医诊断子表
Class HCC.SQL.Document.Diagnosis.TCM Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 中医诊断
Property TCMdiag As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = TCMdiag ];

/// 文档编号
Relationship Diagnosis As HCC.SQL.Document.Diagnosis [ Cardinality = parent, Inverse = TCM, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="TCMDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>TCMdiag</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("TCM")</DataLocation>
<DefaultData>TCMDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DiagnosisC("TCM")</IdLocation>
<IndexLocation>^HCC.SQL.Document.DiagnA237.TCMI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.DiagnA237.TCMS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
