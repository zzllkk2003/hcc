Class WS.DE.DE051005300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "入院原因";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051005300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051005300State</State>
<StreamLocation>^WS.DE.DE051005300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
