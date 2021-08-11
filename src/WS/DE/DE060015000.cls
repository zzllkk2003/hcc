Class WS.DE.DE060015000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 1000, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "预防接种后不良反应处理结果";

Parameter Format = "AN..1000";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060015000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060015000State</State>
<StreamLocation>^WS.DE.DE060015000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
