Class WS.DE.DE051011400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "智力发育";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051011400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051011400State</State>
<StreamLocation>^WS.DE.DE051011400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
