Class WS.DE.DE051002700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "高危评分日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE051002700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051002700State</State>
<StreamLocation>^WS.DE.DE051002700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
