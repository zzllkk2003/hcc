Class WS.DE.DE021001500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "分娩总出血量(mL)";

Parameter Format = "N5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 10000);

Storage Default
{
<Data name="DE021001500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021001500State</State>
<StreamLocation>^WS.DE.DE021001500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
