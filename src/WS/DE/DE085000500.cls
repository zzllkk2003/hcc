Class WS.DE.DE085000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "设备价值金额数(万元)";

Parameter Format = "N..6,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE085000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085000500State</State>
<StreamLocation>^WS.DE.DE085000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
