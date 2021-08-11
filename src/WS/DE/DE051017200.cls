Class WS.DE.DE051017200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "辩证分型名称";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051017200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051017200State</State>
<StreamLocation>^WS.DE.DE051017200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
