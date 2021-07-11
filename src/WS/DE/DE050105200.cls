Class WS.DE.DE050105200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "预防接种后不良反应临床诊断代码";

Parameter Format = "N4";

Parameter ValueSet = "CV05.01.032";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.032");

Storage Default
{
<Data name="DE050105200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050105200State</State>
<StreamLocation>^WS.DE.DE050105200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
