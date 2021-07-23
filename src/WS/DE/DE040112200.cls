Class WS.DE.DE040112200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "心理状况详细描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE040112200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040112200State</State>
<StreamLocation>^WS.DE.DE040112200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
