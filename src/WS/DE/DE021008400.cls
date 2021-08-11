Class WS.DE.DE021008400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Parameter Category = "健康史";

Parameter Description = "月经周期(d)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE021008400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021008400State</State>
<StreamLocation>^WS.DE.DE021008400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
