Class WS.DE.DE060023200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "急诊抢救日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060023200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060023200State</State>
<StreamLocation>^WS.DE.DE060023200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
