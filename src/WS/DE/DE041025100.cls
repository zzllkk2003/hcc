Class WS.DE.DE041025100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "产后观察日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE041025100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041025100State</State>
<StreamLocation>^WS.DE.DE041025100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
