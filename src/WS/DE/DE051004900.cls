Class WS.DE.DE051004900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "配偶健康状况";

Parameter Format = "A..30";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 30, MINLEN = 0);

Storage Default
{
<Data name="DE051004900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051004900State</State>
<StreamLocation>^WS.DE.DE051004900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
