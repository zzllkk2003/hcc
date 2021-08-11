Class WS.DE.DE060020100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "隔离标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060020100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060020100State</State>
<StreamLocation>^WS.DE.DE060020100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
