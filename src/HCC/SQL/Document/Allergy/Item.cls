/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 过敏条目
/// 注意，这不是章节类，是过敏条目类
Class HCC.SQL.Document.Allergy.Item Extends (%Persistent, %XML.Adaptor)
{

/// 文档号
Relationship Allergy As HCC.SQL.Document.Allergy(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Allergies, SqlFieldName = DocumentNo ];

/// 过敏症状出现日期
Property effectiveTime As %Date(FORMAT = 8) [ SqlFieldName = eff_time ];

/// 过敏源
Property allergen As WS.DE.DE021002200 [ SqlFieldName = allergen ];

Storage Default
{
<Data name="ItemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>effectiveTime</Value>
</Value>
<Value name="3">
<Value>allergen</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Allergies")</DataLocation>
<DefaultData>ItemDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.AllergyC("Allergies")</IdLocation>
<IndexLocation>^HCC.SQL.Document.Allergy.ItemI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.Allergy.ItemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
