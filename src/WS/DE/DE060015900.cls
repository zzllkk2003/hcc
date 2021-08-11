Class WS.DE.DE060015900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 200, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "治疗方案";

Parameter Format = "AN..200";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060015900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060015900State</State>
<StreamLocation>^WS.DE.DE060015900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
