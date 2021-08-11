Class WS.DE.DE060008800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "清宫操作标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060008800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060008800State</State>
<StreamLocation>^WS.DE.DE060008800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
