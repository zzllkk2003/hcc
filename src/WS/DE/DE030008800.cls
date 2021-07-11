Class WS.DE.DE030008800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "次运动时长(min)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE030008800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030008800State</State>
<StreamLocation>^WS.DE.DE030008800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
