Class WS.DE.DE041025000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "宫缩开始日时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE041025000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041025000State</State>
<StreamLocation>^WS.DE.DE041025000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
