Class WS.DE.DE060026400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输血反应标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060026400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060026400State</State>
<StreamLocation>^WS.DE.DE060026400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
