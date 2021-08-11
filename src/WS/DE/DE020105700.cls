Class WS.DE.DE020105700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "下次访视地点";

Parameter Format = "A..30";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 30, MINLEN = 0);

Storage Default
{
<Data name="DE020105700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020105700State</State>
<StreamLocation>^WS.DE.DE020105700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
