Class WS.DE.DE060009900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "首次就诊日期";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060009900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060009900State</State>
<StreamLocation>^WS.DE.DE060009900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
