Class WS.DE.DE070000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "卫生费用";

Parameter Description = "个人承担费用(元)";

Parameter Format = "N..10,2";

Parameter ValueSet;

Parameter WSDT = "F";

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
