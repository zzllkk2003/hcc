Class WS.DE.DE060006600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "康复措施指导";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060006600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060006600State</State>
<StreamLocation>^WS.DE.DE060006600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
