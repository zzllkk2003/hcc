Class WS.DE.DE041016900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "肾脏检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041016900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041016900State</State>
<StreamLocation>^WS.DE.DE041016900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}