Class WS.DE.DE041022900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "预约体检日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE041022900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041022900State</State>
<StreamLocation>^WS.DE.DE041022900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
