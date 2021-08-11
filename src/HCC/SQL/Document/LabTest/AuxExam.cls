/// 辅助检查条目子表
Class HCC.SQL.Document.LabTest.AuxExam Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号
Relationship LabTest As HCC.SQL.Document.LabTest [ Cardinality = parent, Inverse = AuxExams, SqlFieldName = DocumentNo ];

/// 辅助检查名称
Property name As WS.DE.DE043001000 [ SqlFieldName = name ];

/// 辅助检查结果
Property result As WS.DE.DE043000900 [ SqlFieldName = result ];

Storage Default
{
<Data name="AuxExamDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>result</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("AuxExams")</DataLocation>
<DefaultData>AuxExamDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.LabTestC("AuxExams")</IdLocation>
<IndexLocation>^HCC.SQL.Document.L7824.AuxExamI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.L7824.AuxExamS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
