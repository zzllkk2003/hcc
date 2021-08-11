Class WS.DE.DE040109900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "咽痛标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040109900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040109900State</State>
<StreamLocation>^WS.DE.DE040109900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
