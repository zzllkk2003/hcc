Class WS.DE.DE040108700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "心悸标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040108700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040108700State</State>
<StreamLocation>^WS.DE.DE040108700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
