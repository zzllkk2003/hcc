Class WS.DE.DE040103500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "口渴标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040103500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040103500State</State>
<StreamLocation>^WS.DE.DE040103500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
