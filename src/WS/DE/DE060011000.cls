Class WS.DE.DE060011000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "随访心理指导标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060011000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060011000State</State>
<StreamLocation>^WS.DE.DE060011000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
