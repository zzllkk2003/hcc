/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 用药章节 - 术中用药条目子表
/// 用于《一般手术记录》
Class HCC.SQL.Document.MedicationUseHistory.InSurMed Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 术前用药
Property item As WS.DE.DE060013600 [ SqlFieldName = item ];

/// 文档编号
Relationship MedicationUseHistory As HCC.SQL.Document.MedicationUseHistory [ Cardinality = parent, Inverse = InSurMeds, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="InSurMedDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>item</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("InSurMeds")</DataLocation>
<DefaultData>InSurMedDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.MedicationUC801C("InSurMeds")</IdLocation>
<IndexLocation>^HCC.SQL.Document2600.InSurMedI</IndexLocation>
<StreamLocation>^HCC.SQL.Document2600.InSurMedS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
