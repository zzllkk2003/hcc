Class WS.DE.DE043001600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "特殊检查标志";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE043001600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043001600State</State>
<StreamLocation>^WS.DE.DE043001600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
