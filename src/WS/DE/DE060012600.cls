Class WS.DE.DE060012600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "血吸虫病原治疗日期";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060012600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060012600State</State>
<StreamLocation>^WS.DE.DE060012600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
