Class WS.DE.DE051007200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "体检结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051007200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051007200State</State>
<StreamLocation>^WS.DE.DE051007200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
