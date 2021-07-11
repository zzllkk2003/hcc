Class WS.DE.DE060012900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "药物不良反应标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060012900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060012900State</State>
<StreamLocation>^WS.DE.DE060012900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
