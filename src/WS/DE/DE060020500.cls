Class WS.DE.DE060020500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "护士核对时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060020500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060020500State</State>
<StreamLocation>^WS.DE.DE060020500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
