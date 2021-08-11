Class WS.DE.DE051015800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "特殊情况";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051015800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051015800State</State>
<StreamLocation>^WS.DE.DE051015800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
