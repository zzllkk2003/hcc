Class WS.DE.DE051013500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "头位难产情况的评估";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051013500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051013500State</State>
<StreamLocation>^WS.DE.DE051013500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
