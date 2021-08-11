Class WS.DE.DE021001200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "分娩活产个数";

Parameter Format = "N1";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9, MINVAL = 1);

Storage Default
{
<Data name="DE021001200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021001200State</State>
<StreamLocation>^WS.DE.DE021001200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
