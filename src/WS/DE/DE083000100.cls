Class WS.DE.DE083000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99999999, MINVAL = 0);

Parameter Category = "卫生人员";

Parameter Description = "持健康合格证明人数";

Parameter Format = "N..8";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE083000100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083000100State</State>
<StreamLocation>^WS.DE.DE083000100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
