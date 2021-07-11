Class WS.DE.DE060025900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "手术日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060025900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060025900State</State>
<StreamLocation>^WS.DE.DE060025900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
