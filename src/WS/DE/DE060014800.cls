Class WS.DE.DE060014800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "用药停止日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE060014800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060014800State</State>
<StreamLocation>^WS.DE.DE060014800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
