Class WS.DE.DE040100900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "多汗标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040100900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040100900State</State>
<StreamLocation>^WS.DE.DE040100900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
