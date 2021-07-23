Class WS.DE.DE051003200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "健康评价异常描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051003200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051003200State</State>
<StreamLocation>^WS.DE.DE051003200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
