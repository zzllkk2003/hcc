Class WS.DE.DE060021900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "医嘱计划结束时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060021900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060021900State</State>
<StreamLocation>^WS.DE.DE060021900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
