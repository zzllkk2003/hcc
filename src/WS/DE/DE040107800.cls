Class WS.DE.DE040107800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "头痛标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040107800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040107800State</State>
<StreamLocation>^WS.DE.DE040107800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
