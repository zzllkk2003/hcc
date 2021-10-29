/// 主要健康问题章节 - 初步诊断-中医条目
Class HCC.SQL.Document.HealthProblem.TCMPreliminaryDiag Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 初步诊断-中医
Property TCMdiag As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = TCM ];

/// 初步诊断-中医证候
Property syndrome As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = syndrome ];

Storage Default
{
<Data name="TCMPreliminaryDiagState">
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
<State>TCMPreliminaryDiagState</State>
<StreamLocation>^HCC.SQL.DoDAD8.TCMPrelimin7D17S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
