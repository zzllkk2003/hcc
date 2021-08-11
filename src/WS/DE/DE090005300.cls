Class WS.DE.DE090005300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

/// 未找到该数据元的出处
Parameter Category = "填报日期时间";

Parameter Description = "填报日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE090005300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE090005300State</State>
<StreamLocation>^WS.DE.DE090005300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
