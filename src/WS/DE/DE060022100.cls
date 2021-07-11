Class WS.DE.DE060022100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "症状开始日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060022100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060022100State</State>
<StreamLocation>^WS.DE.DE060022100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
