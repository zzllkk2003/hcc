Class WS.DE.DE043004300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "心电图检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE043004300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043004300State</State>
<StreamLocation>^WS.DE.DE043004300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
