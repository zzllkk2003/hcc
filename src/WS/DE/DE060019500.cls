Class WS.DE.DE060019500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "出院31天内再住院目的";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060019500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060019500State</State>
<StreamLocation>^WS.DE.DE060019500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
