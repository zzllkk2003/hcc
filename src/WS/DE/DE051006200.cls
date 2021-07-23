Class WS.DE.DE051006200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "手术并发症详细描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051006200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051006200State</State>
<StreamLocation>^WS.DE.DE051006200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
