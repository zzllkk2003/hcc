Class WS.DE.DE020103900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "姓名";

Parameter Format = "A..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE020103900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020103900State</State>
<StreamLocation>^WS.DE.DE020103900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
