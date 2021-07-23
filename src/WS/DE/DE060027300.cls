Class WS.DE.DE060027300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "胎盘娩出日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060027300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060027300State</State>
<StreamLocation>^WS.DE.DE060027300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
