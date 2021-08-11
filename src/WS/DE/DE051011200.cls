Class WS.DE.DE051011200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.009");

Parameter Category = "医学评估";

Parameter Description = "职业健康检查结论代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.009";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051011200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051011200State</State>
<StreamLocation>^WS.DE.DE051011200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
