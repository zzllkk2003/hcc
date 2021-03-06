Class WS.DE.DE051001200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "产前诊断医学指导意见";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051001200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051001200State</State>
<StreamLocation>^WS.DE.DE051001200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
