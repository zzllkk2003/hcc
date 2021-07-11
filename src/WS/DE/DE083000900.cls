Class WS.DE.DE083000900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "监督员在编标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE083000900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083000900State</State>
<StreamLocation>^WS.DE.DE083000900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
