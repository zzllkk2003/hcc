Class WS.DE.DE051010900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "诊断结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051010900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051010900State</State>
<StreamLocation>^WS.DE.DE051010900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
