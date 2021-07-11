/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 过敏
/// 注意，这不是章节类，是过敏元素类
/// 不需要过敏章节类
Class HCC.SQL.Document.Allergy Extends (%Persistent, %XML.Adaptor)
{

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Allergies ];

/// 过敏症状出现日期
Property effectiveTime As %Date(FORMAT = 8) [ SqlFieldName = effective_time ];

/// 过敏源
Property value As WS.DE.DE021002200 [ SqlFieldName = value ];

Storage Default
{
<Data name="AllergyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>type</Value>
</Value>
<Value name="3">
<Value>value</Value>
</Value>
<Value name="4">
<Value>effectiveTime</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Allergies")</DataLocation>
<DefaultData>AllergyDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentC("Allergies")</IdLocation>
<IndexLocation>^HCC.SQL.Document.AllergyI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.AllergyS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
