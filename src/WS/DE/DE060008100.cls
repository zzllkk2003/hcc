Class WS.DE.DE060008100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "目标体重(kg)";

Parameter Format = "N3..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 1);

Storage Default
{
<Data name="DE060008100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060008100State</State>
<StreamLocation>^WS.DE.DE060008100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
