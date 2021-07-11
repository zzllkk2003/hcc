Class WS.DE.DE043004800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "1秒钟用力呼气量(mL)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE043004800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043004800State</State>
<StreamLocation>^WS.DE.DE043004800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
