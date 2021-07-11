Class WS.DE.DE043003000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "其他辅助检查";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE043003000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043003000State</State>
<StreamLocation>^WS.DE.DE043003000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
