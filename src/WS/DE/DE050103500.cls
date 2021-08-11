Class WS.DE.DE050103500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "确诊日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE050103500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050103500State</State>
<StreamLocation>^WS.DE.DE050103500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
