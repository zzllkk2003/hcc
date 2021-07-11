Class WS.DE.DE083000700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "稽查人员标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE083000700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083000700State</State>
<StreamLocation>^WS.DE.DE083000700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
