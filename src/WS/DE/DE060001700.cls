Class WS.DE.DE060001700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "出院日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060001700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060001700State</State>
<StreamLocation>^WS.DE.DE060001700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
