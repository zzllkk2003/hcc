Class WS.DE.DE051013700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "会阴情况";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051013700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051013700State</State>
<StreamLocation>^WS.DE.DE051013700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
