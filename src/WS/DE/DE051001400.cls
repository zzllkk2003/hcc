Class WS.DE.DE051001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "处置计划";

Parameter Format = "AN..200";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 200, MINLEN = 0);

Storage Default
{
<Data name="DE051001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051001400State</State>
<StreamLocation>^WS.DE.DE051001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
