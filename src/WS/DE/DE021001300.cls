Class WS.DE.DE021001300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "分娩日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE021001300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021001300State</State>
<StreamLocation>^WS.DE.DE021001300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
