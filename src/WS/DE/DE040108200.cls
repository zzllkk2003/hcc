Class WS.DE.DE040108200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "主诉与症状";

Parameter Description = "脱屑部位";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE040108200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040108200State</State>
<StreamLocation>^WS.DE.DE040108200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
