/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 用药章节 - 术前用药条目子表
/// 用于《一般手术记录》
Class HCC.SQL.Document.MedicationUseHistory.PreSurMed Extends (%Persistent, %XML.Adaptor)
{

/// 术前用药
Property item As WS.DE.DE060013600 [ SqlFieldName = item ];

/// 文档编号
Relationship MedicationUseHistory As HCC.SQL.Document.MedicationUseHistory [ Cardinality = parent, Inverse = PreSurMeds, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="PreSurMedDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>item</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("PreSurMeds")</DataLocation>
<DefaultData>PreSurMedDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.MedicationUC801C("PreSurMeds")</IdLocation>
<IndexLocation>^HCC.SQL.Document2600.PreSurMedI</IndexLocation>
<StreamLocation>^HCC.SQL.Document2600.PreSurMedS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
