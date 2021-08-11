Class WS.DE.DE040103900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "流涎标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040103900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040103900State</State>
<StreamLocation>^WS.DE.DE040103900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
