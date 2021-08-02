Class WS.DE.DE010001600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "参加麻醉安全保险标志";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE010001600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010001600State</State>
<StreamLocation>^WS.DE.DE010001600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}