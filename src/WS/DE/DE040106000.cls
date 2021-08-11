Class WS.DE.DE040106000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "伤害发生日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE040106000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040106000State</State>
<StreamLocation>^WS.DE.DE040106000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
