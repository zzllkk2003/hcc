Class WS.DE.DE060027900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "通知医生时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060027900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060027900State</State>
<StreamLocation>^WS.DE.DE060027900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
