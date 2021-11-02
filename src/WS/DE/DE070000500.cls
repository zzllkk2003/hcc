Class WS.DE.DE070000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生费用";

Parameter Description = "收人与支出金额数(万元)";

Parameter Format = "N..6,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="DE070000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070000500State</State>
<StreamLocation>^WS.DE.DE070000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
