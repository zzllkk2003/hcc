Class WS.DE.DE040105400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "气短标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040105400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040105400State</State>
<StreamLocation>^WS.DE.DE040105400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
