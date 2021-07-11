Class WS.DE.DE040102700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "感染日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE040102700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040102700State</State>
<StreamLocation>^WS.DE.DE040102700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
