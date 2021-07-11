Class WS.DE.DE083001700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "卫生监督员类别标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE083001700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083001700State</State>
<StreamLocation>^WS.DE.DE083001700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
