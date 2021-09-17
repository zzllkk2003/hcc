/// 阳性辅助检查结果条目子表
Class HCC.SQL.Document.LabTest.AuxExamResult Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 文档编号
Relationship LabTest As HCC.SQL.Document.LabTest [ Cardinality = parent, Inverse = AuxExamResults, SqlFieldName = DocumentNo ];

/// 阳性辅助检查结果
Property result As WS.DE.DE045012800 [ SqlFieldName = result ];

Storage Default
{
<Data name="AuxExamResultDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>result</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("AuxExamResults")</DataLocation>
<DefaultData>AuxExamResultDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.LabTestC("AuxExamResults")</IdLocation>
<IndexLocation>^HCC.SQL.Docu7824.AuxExamResultI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu7824.AuxExamResultS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
