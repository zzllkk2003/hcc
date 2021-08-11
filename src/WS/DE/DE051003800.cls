Class WS.DE.DE051003800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "可疑食品名称";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051003800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051003800State</State>
<StreamLocation>^WS.DE.DE051003800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
