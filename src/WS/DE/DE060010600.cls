Class WS.DE.DE060010600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输血史标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060010600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060010600State</State>
<StreamLocation>^WS.DE.DE060010600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
