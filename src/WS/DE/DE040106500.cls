Class WS.DE.DE040106500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "失眠标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040106500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040106500State</State>
<StreamLocation>^WS.DE.DE040106500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
