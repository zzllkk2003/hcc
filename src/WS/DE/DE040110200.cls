Class WS.DE.DE040110200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "易激动标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040110200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040110200State</State>
<StreamLocation>^WS.DE.DE040110200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
