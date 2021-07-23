Class WS.DE.DE040106700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "嗜睡标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040106700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040106700State</State>
<StreamLocation>^WS.DE.DE040106700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
