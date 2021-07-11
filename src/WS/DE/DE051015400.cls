Class WS.DE.DE051015400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "胎膜破裂日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE051015400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051015400State</State>
<StreamLocation>^WS.DE.DE051015400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
