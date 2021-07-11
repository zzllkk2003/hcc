Class WS.DE.DE060007000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "两次随访间患病标记";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060007000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060007000State</State>
<StreamLocation>^WS.DE.DE060007000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
