Class WS.DE.DE021007300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "献血日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE021007300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021007300State</State>
<StreamLocation>^WS.DE.DE021007300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
