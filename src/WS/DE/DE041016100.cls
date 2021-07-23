Class WS.DE.DE041016100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "色觉检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041016100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041016100State</State>
<StreamLocation>^WS.DE.DE041016100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
