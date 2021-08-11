Class WS.DE.DE021001000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "分娩次数";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE021001000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021001000State</State>
<StreamLocation>^WS.DE.DE021001000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
