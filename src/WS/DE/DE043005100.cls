Class WS.DE.DE043005100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "最大肺活量(L)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Storage Default
{
<Data name="DE043005100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043005100State</State>
<StreamLocation>^WS.DE.DE043005100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
