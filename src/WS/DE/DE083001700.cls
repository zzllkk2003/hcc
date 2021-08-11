Class WS.DE.DE083001700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "卫生人员";

Parameter Description = "卫生监督员类别标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

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
