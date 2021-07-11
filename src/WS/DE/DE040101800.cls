Class WS.DE.DE040101800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "发病日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE040101800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040101800State</State>
<StreamLocation>^WS.DE.DE040101800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
