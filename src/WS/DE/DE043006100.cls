Class WS.DE.DE043006100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "羊水量";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE043006100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043006100State</State>
<StreamLocation>^WS.DE.DE043006100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
