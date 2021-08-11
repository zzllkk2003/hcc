Class WS.DE.DE060022000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "医嘱开立日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060022000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060022000State</State>
<StreamLocation>^WS.DE.DE060022000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
