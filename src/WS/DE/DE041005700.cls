Class WS.DE.DE041005700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "体格检查";

Parameter Description = "肝脏触诊结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE041005700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041005700State</State>
<StreamLocation>^WS.DE.DE041005700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
