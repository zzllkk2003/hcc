Class WS.DE.DE041024600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "产后检查时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE041024600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041024600State</State>
<StreamLocation>^WS.DE.DE041024600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
