Class WS.DE.DE040109600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "血吸虫病感染地点";

Parameter Format = "A..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Storage Default
{
<Data name="DE040109600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040109600State</State>
<StreamLocation>^WS.DE.DE040109600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
