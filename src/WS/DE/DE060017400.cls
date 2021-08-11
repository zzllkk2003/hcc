Class WS.DE.DE060017400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "转诊标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060017400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060017400State</State>
<StreamLocation>^WS.DE.DE060017400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
