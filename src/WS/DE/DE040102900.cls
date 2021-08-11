Class WS.DE.DE040102900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "记忆力减退标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040102900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040102900State</State>
<StreamLocation>^WS.DE.DE040102900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
