Class WS.DE.DE040100200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "便血标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040100200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040100200State</State>
<StreamLocation>^WS.DE.DE040100200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
