Class WS.DE.DE051003300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "健康问题评估";

Parameter Format = "AN..200";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 200, MINLEN = 0);

Storage Default
{
<Data name="DE051003300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051003300State</State>
<StreamLocation>^WS.DE.DE051003300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
