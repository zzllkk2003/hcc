Class WS.DE.DE060031800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "供氧时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060031800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060031800State</State>
<StreamLocation>^WS.DE.DE060031800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
