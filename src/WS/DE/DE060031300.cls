Class WS.DE.DE060031300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "转出日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060031300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060031300State</State>
<StreamLocation>^WS.DE.DE060031300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
