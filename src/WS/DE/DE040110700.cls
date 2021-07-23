Class WS.DE.DE040110700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "月经异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040110700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040110700State</State>
<StreamLocation>^WS.DE.DE040110700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
