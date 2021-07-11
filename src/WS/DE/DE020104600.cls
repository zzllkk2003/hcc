Class WS.DE.DE020104600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "英文域名";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE020104600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020104600State</State>
<StreamLocation>^WS.DE.DE020104600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
