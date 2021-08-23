Class WS.DE.DE060023300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "清醒日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060023300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060023300State</State>
<StreamLocation>^WS.DE.DE060023300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
