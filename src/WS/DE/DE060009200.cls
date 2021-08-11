Class WS.DE.DE060009200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "入院日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060009200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060009200State</State>
<StreamLocation>^WS.DE.DE060009200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
