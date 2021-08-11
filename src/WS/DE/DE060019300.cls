Class WS.DE.DE060019300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "出院情况";

Parameter Format = "AN..1000";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 1000, MINLEN = 0);

Storage Default
{
<Data name="DE060019300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060019300State</State>
<StreamLocation>^WS.DE.DE060019300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
