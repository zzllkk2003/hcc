Class WS.DE.DE060010500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输血日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060010500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060010500State</State>
<StreamLocation>^WS.DE.DE060010500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
