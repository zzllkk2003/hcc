Class WS.DE.DE060015100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "预约日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE060015100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060015100State</State>
<StreamLocation>^WS.DE.DE060015100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
