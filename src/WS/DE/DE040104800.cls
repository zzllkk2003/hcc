Class WS.DE.DE040104800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "呕吐标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040104800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040104800State</State>
<StreamLocation>^WS.DE.DE040104800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
