Class WS.DE.DE043000900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "辅助检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE043000900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043000900State</State>
<StreamLocation>^WS.DE.DE043000900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
