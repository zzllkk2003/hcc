/// 主要健康问题章节 - 确定诊断-中医条目子表
Class HCC.SQL.Document.HealthProblem.TCMConfirmedDiag Extends (%Persistent, %XML.Adaptor)
{

/// 诊断-中医
Property TCMdiag As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = TCM ];

/// 诊断-中医证候
Property syndrome As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = syndrome ];

/// 文档编号
Relationship healthProblem As HCC.SQL.Document.HealthProblem [ Cardinality = parent, Inverse = TCMdiagnoses, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="TCMConfirmedDiagDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>code</Value>
</Value>
<Value name="4">
<Value>syndromeName</Value>
</Value>
<Value name="5">
<Value>syndromeCode</Value>
</Value>
<Value name="6">
<Value>date</Value>
</Value>
<Value name="7">
<Value>orders</Value>
</Value>
<Value name="8">
<Value>TCMdiag</Value>
</Value>
<Value name="9">
<Value>syndrome</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("TCMdiagnoses")</DataLocation>
<DefaultData>TCMConfirmedDiagDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.HealthProblemC("TCMdiagnoses")</IdLocation>
<IndexLocation>^HCC.SQL.DoDAD8.TCMConfirme9E1AI</IndexLocation>
<StreamLocation>^HCC.SQL.DoDAD8.TCMConfirme9E1AS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
