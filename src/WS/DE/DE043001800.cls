Class WS.DE.DE043001800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "检查/检验类别";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE043001800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043001800State</State>
<StreamLocation>^WS.DE.DE043001800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
