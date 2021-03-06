Class WS.DE.DE051013300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "病例特点";

Parameter Format = "AN..1000";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 1000, MINLEN = 0);

Storage Default
{
<Data name="DE051013300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051013300State</State>
<StreamLocation>^WS.DE.DE051013300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
