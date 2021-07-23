Class WS.DE.DE043002400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "门静脉内径(mm)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE043002400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043002400State</State>
<StreamLocation>^WS.DE.DE043002400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
