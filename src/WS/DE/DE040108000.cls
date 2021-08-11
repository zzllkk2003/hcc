Class WS.DE.DE040108000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "主诉与症状";

Parameter Description = "脱发部位";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE040108000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040108000State</State>
<StreamLocation>^WS.DE.DE040108000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
