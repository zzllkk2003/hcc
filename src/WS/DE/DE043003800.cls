Class WS.DE.DE043003800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "视觉诱发电位检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE043003800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043003800State</State>
<StreamLocation>^WS.DE.DE043003800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
