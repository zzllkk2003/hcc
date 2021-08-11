Class WS.DE.DE085002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Parameter Category = "药品、设备与材料";

Parameter Description = "胰岛素用药次剂量(U)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE085002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085002000State</State>
<StreamLocation>^WS.DE.DE085002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
