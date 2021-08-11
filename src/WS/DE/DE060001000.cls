Class WS.DE.DE060001000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "采血日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060001000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060001000State</State>
<StreamLocation>^WS.DE.DE060001000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
