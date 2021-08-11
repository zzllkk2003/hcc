Class WS.DE.DE040102500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "肝区痛标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040102500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040102500State</State>
<StreamLocation>^WS.DE.DE040102500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
