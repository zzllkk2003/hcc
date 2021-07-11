Class WS.DE.DE060022400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "临产日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060022400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060022400State</State>
<StreamLocation>^WS.DE.DE060022400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
