Class WS.DE.DE020102800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "迁出原因";

Parameter Format = "A..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE020102800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020102800State</State>
<StreamLocation>^WS.DE.DE020102800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
