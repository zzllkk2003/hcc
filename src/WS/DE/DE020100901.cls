Class WS.DE.DE020100901 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "地址-省(自治区、直辖市)";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Storage Default
{
<Data name="DE020100901State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100901State</State>
<StreamLocation>^WS.DE.DE020100901S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
