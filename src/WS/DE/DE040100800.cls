Class WS.DE.DE040100800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "盗汗标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040100800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040100800State</State>
<StreamLocation>^WS.DE.DE040100800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
