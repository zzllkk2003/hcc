Class WS.DE.DE020103200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "实足年龄";

Parameter Format = "AN..5";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 5, MINLEN = 0);

Storage Default
{
<Data name="DE020103200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020103200State</State>
<StreamLocation>^WS.DE.DE020103200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
