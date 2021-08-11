Class WS.DE.DE043005800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "前羊水性状";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE043005800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043005800State</State>
<StreamLocation>^WS.DE.DE043005800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
