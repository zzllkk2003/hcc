Class WS.DE.DE043000700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "病理检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE043000700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043000700State</State>
<StreamLocation>^WS.DE.DE043000700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
