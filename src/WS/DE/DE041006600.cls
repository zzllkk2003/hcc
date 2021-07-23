Class WS.DE.DE041006600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "跟腱反射检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041006600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041006600State</State>
<StreamLocation>^WS.DE.DE041006600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
