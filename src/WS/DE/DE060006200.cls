Class WS.DE.DE060006200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "就诊日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060006200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060006200State</State>
<StreamLocation>^WS.DE.DE060006200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
