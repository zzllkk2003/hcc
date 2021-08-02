Class WS.DE.DE060018900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "查房日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060018900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060018900State</State>
<StreamLocation>^WS.DE.DE060018900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}