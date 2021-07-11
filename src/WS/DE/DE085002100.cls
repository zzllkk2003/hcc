Class WS.DE.DE085002100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "药物疗程(d)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE085002100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085002100State</State>
<StreamLocation>^WS.DE.DE085002100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
