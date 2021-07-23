Class WS.DE.DE051013400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "手术时产妇情况";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051013400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051013400State</State>
<StreamLocation>^WS.DE.DE051013400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
