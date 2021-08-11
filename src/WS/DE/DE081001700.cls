Class WS.DE.DE081001700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "卫生机构";

Parameter Description = "稽查机构专设标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE081001700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081001700State</State>
<StreamLocation>^WS.DE.DE081001700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
