Class WS.DE.DE060010200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输精管切除长度(cm)";

Parameter Format = "N3..4,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE060010200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060010200State</State>
<StreamLocation>^WS.DE.DE060010200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
