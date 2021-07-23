Class WS.DE.DE040109100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "胸闷标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040109100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040109100State</State>
<StreamLocation>^WS.DE.DE040109100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
