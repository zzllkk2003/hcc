/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 术前诊断章节表 - 诊断条目子表
Class HCC.SQL.Document.SurgOperNotePreoperativeDX.Item Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 疾病诊断
Property diagnosisCode As WS.DE.DE050102400 [ SqlFieldName = diag_code ];

Relationship Diagnosis As HCC.SQL.Document.SurgicalOperationNotePreoperativeDX [ Cardinality = parent, Inverse = Items, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="ItemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diagnosisCode</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Items")</DataLocation>
<DefaultData>ItemDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.SurgicalOpe1CCCC("Items")</IdLocation>
<IndexLocation>^HCC.SQL.Document.Surg3435.ItemI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.Surg3435.ItemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
