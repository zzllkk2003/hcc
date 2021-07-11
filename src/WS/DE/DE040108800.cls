Class WS.DE.DE040108800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "心前区不适标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040108800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040108800State</State>
<StreamLocation>^WS.DE.DE040108800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
