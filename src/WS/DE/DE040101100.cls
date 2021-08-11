Class WS.DE.DE040101100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "多梦标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040101100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040101100State</State>
<StreamLocation>^WS.DE.DE040101100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
