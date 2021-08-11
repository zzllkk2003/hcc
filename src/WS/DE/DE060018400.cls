Class WS.DE.DE060018400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "目前情况";

Parameter Format = "AN..1000";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 1000, MINLEN = 0);

Storage Default
{
<Data name="DE060018400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060018400State</State>
<StreamLocation>^WS.DE.DE060018400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
