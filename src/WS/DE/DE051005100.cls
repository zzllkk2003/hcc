Class WS.DE.DE051005100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "妊娠结局";

Parameter Format = "A..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE051005100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051005100State</State>
<StreamLocation>^WS.DE.DE051005100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
