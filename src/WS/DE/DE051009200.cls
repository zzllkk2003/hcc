Class WS.DE.DE051009200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "血吸虫病转归代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.010";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.010");

Storage Default
{
<Data name="DE051009200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051009200State</State>
<StreamLocation>^WS.DE.DE051009200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
