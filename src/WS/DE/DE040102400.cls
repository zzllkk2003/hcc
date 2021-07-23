Class WS.DE.DE040102400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "腹胀标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040102400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040102400State</State>
<StreamLocation>^WS.DE.DE040102400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
