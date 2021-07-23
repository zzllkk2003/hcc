Class WS.DE.DE021006700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "外伤发生日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE021006700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021006700State</State>
<StreamLocation>^WS.DE.DE021006700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
