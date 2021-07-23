Class WS.DE.DE050107500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "手术后可能出现的意外及并发症";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE050107500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050107500State</State>
<StreamLocation>^WS.DE.DE050107500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
