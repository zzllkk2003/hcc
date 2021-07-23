Class WS.DE.DE041021200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "嗅觉检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041021200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041021200State</State>
<StreamLocation>^WS.DE.DE041021200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
