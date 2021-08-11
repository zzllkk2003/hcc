Class WS.DE.DE051013800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "颅脑损伤患者入院前昏迷时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE051013800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051013800State</State>
<StreamLocation>^WS.DE.DE051013800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
