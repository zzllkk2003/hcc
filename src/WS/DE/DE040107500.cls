Class WS.DE.DE040107500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "痛经标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040107500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040107500State</State>
<StreamLocation>^WS.DE.DE040107500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
