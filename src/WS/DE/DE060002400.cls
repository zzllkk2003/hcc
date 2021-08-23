Class WS.DE.DE060002400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "访视日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE060002400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060002400State</State>
<StreamLocation>^WS.DE.DE060002400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
