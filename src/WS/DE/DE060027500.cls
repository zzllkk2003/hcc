Class WS.DE.DE060027500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "讨论日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060027500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060027500State</State>
<StreamLocation>^WS.DE.DE060027500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
