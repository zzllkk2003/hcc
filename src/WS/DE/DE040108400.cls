Class WS.DE.DE040108400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "消瘦标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040108400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040108400State</State>
<StreamLocation>^WS.DE.DE040108400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
