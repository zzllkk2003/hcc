Class WS.DE.DE060024000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "使用麻醉镇痛泵标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060024000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060024000State</State>
<StreamLocation>^WS.DE.DE060024000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
