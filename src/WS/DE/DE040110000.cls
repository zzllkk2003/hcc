Class WS.DE.DE040110000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "眼痛标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040110000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040110000State</State>
<StreamLocation>^WS.DE.DE040110000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}