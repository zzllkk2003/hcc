Class WS.DE.DE060028200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "小结日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060028200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060028200State</State>
<StreamLocation>^WS.DE.DE060028200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
