Class WS.DE.DE060031600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "转入日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060031600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060031600State</State>
<StreamLocation>^WS.DE.DE060031600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
