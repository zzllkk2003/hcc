Class WS.DE.DE060019100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "出手术室日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060019100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060019100State</State>
<StreamLocation>^WS.DE.DE060019100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
