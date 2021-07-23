Class WS.DE.DE060016200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "治疗性引产标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060016200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060016200State</State>
<StreamLocation>^WS.DE.DE060016200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
