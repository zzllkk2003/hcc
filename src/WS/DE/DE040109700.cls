Class WS.DE.DE040109700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "血吸虫病感染环境名称";

Parameter Format = "A..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Storage Default
{
<Data name="DE040109700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040109700State</State>
<StreamLocation>^WS.DE.DE040109700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
