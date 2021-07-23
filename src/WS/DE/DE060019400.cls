Class WS.DE.DE060019400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "出院31天内再住院标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060019400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060019400State</State>
<StreamLocation>^WS.DE.DE060019400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
