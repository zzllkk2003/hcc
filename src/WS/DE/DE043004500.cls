Class WS.DE.DE043004500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "胸部X线检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE043004500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043004500State</State>
<StreamLocation>^WS.DE.DE043004500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
