Class WS.DE.DE060023500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "收入观察室日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060023500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060023500State</State>
<StreamLocation>^WS.DE.DE060023500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
