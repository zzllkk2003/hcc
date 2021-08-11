Class WS.DE.DE051016200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "手术中可能出现的意外及风险";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051016200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051016200State</State>
<StreamLocation>^WS.DE.DE051016200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
