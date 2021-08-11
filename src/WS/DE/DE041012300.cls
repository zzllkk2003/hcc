Class WS.DE.DE041012300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "胚囊排出日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE041012300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041012300State</State>
<StreamLocation>^WS.DE.DE041012300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
