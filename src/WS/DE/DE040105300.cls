Class WS.DE.DE040105300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "疲乏无力标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040105300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040105300State</State>
<StreamLocation>^WS.DE.DE040105300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
