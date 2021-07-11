Class WS.DE.DE040112000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "咨询问题";

Parameter Format = "AN..200";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 200, MINLEN = 0);

Storage Default
{
<Data name="DE040112000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040112000State</State>
<StreamLocation>^WS.DE.DE040112000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
