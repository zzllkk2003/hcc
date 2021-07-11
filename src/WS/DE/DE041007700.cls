Class WS.DE.DE041007700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "骨盆测量日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE041007700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041007700State</State>
<StreamLocation>^WS.DE.DE041007700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
