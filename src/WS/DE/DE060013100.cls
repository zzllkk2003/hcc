Class WS.DE.DE060013100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "药物副作用标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060013100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060013100State</State>
<StreamLocation>^WS.DE.DE060013100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
