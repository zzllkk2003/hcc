Class WS.DE.DE060027000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "手术或分娩后日数";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE060027000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060027000State</State>
<StreamLocation>^WS.DE.DE060027000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
