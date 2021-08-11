Class WS.DE.DE040111100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Parameter Category = "主诉与症状";

Parameter Description = "孕早期患病情况";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE040111100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040111100State</State>
<StreamLocation>^WS.DE.DE040111100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
