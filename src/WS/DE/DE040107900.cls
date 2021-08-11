Class WS.DE.DE040107900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "脱发标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040107900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040107900State</State>
<StreamLocation>^WS.DE.DE040107900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
