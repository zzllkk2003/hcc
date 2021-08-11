Class WS.DE.DE060023600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "入手术室时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060023600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060023600State</State>
<StreamLocation>^WS.DE.DE060023600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
