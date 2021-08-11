Class WS.DE.DE051008200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "心电图异常描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051008200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051008200State</State>
<StreamLocation>^WS.DE.DE051008200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
