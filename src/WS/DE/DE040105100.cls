Class WS.DE.DE040105100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "排尿困难标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040105100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040105100State</State>
<StreamLocation>^WS.DE.DE040105100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
