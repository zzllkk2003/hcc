Class WS.DE.DE040102200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "腹泻标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040102200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040102200State</State>
<StreamLocation>^WS.DE.DE040102200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
