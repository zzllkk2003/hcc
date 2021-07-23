Class WS.DE.DE060000900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "病原治疗史标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060000900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060000900State</State>
<StreamLocation>^WS.DE.DE060000900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
