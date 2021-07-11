Class WS.DE.DE070001000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生费用";

Parameter Description = "住院费用金额(元)";

Parameter Format = "N..10,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE070001000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070001000State</State>
<StreamLocation>^WS.DE.DE070001000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
