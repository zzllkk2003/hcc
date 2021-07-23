Class WS.DE.DE040112300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "肠胀气标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040112300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040112300State</State>
<StreamLocation>^WS.DE.DE040112300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
