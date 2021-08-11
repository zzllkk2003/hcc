Class WS.DE.DE060025400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "手术要点";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060025400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060025400State</State>
<StreamLocation>^WS.DE.DE060025400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
