Class WS.DE.DE040110900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "主诉与症状";

Parameter Description = "孕期异常情况记录";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE040110900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040110900State</State>
<StreamLocation>^WS.DE.DE040110900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
