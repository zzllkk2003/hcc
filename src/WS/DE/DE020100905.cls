Class WS.DE.DE020100905 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "地址-村(街、路、弄等)";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Storage Default
{
<Data name="DE020100905State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100905State</State>
<StreamLocation>^WS.DE.DE020100905S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
