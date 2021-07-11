Class WS.DE.DE040111800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "症状名称";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE040111800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040111800State</State>
<StreamLocation>^WS.DE.DE040111800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
