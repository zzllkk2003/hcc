Class WS.DE.DE060028400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "修补手术过程";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060028400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060028400State</State>
<StreamLocation>^WS.DE.DE060028400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
