Class WS.DE.DE050105900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "诊断日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE050105900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050105900State</State>
<StreamLocation>^WS.DE.DE050105900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
