Class WS.DE.DE070000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生费用";

Parameter Description = "个人承担费用(元)";

Parameter Format = "N..10,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 9999999.99, MINVAL = 0, SCALE = 2);

Storage Default
{
<Data name="DE070000100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070000100State</State>
<StreamLocation>^WS.DE.DE070000100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
