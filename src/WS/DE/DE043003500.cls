Class WS.DE.DE043003500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "乳腺X线检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE043003500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043003500State</State>
<StreamLocation>^WS.DE.DE043003500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
