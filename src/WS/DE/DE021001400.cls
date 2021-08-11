Class WS.DE.DE021001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "分娩孕周(d)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Storage Default
{
<Data name="DE021001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021001400State</State>
<StreamLocation>^WS.DE.DE021001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
