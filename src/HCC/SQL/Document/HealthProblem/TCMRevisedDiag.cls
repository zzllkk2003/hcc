/// 主要健康问题章节 - 修正诊断-中医条目
Class HCC.SQL.Document.HealthProblem.TCMRevisedDiag Extends (%SerialObject, %XML.Adaptor)
{

/// 修正诊断-中医
Property TCMdiag As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = TCM ];

/// 修正诊断-中医证候
Property syndrome As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = syndrome ];

Storage Default
{
<Data name="TCMRevisedDiagState">
<Value name="1">
<Value>name</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
<Value name="3">
<Value>syndromeName</Value>
</Value>
<Value name="4">
<Value>syndromeCode</Value>
</Value>
<Value name="5">
<Value>date</Value>
</Value>
<Value name="6">
<Value>orders</Value>
</Value>
<Value name="7">
<Value>TCMdiag</Value>
</Value>
<Value name="8">
<Value>syndrome</Value>
</Value>
</Data>
<State>TCMRevisedDiagState</State>
<StreamLocation>^HCC.SQL.DocDAD8.TCMRevisedDiagS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
