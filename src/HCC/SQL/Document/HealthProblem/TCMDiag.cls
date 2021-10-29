/// 主要健康问题章节 - 初步诊断-中医条目
Class HCC.SQL.Document.HealthProblem.TCMDiag Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 初步诊断-中医
Property TCMdiag As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = TCM ];

/// 初步诊断-中医证候
Property syndrome As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = syndrome ];

Storage Default
{
<Data name="TCMDiagState">
<Value name="1">
<Value>TCMdiag</Value>
</Value>
<Value name="2">
<Value>syndrome</Value>
</Value>
</Data>
<State>TCMDiagState</State>
<StreamLocation>^HCC.SQL.Document.HDAD8.TCMDiagS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
