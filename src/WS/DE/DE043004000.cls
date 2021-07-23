Class WS.DE.DE043004000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "输卵管检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE043004000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043004000State</State>
<StreamLocation>^WS.DE.DE043004000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
