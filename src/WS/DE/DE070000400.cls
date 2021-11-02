Class WS.DE.DE070000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生费用";

Parameter Description = "门诊费用金额(元)";

Parameter Format = "N..8,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="DE070000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070000400State</State>
<StreamLocation>^WS.DE.DE070000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
