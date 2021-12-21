Class WS.DE.DE060029800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 2000, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "诊疗计划";

Parameter Format = "AN..2000";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060029800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060029800State</State>
<StreamLocation>^WS.DE.DE060029800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
