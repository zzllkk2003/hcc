Class WS.DE.DE040103200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "咳嗽标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040103200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040103200State</State>
<StreamLocation>^WS.DE.DE040103200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}