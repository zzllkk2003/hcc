Class WS.DE.DE020100906 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "地址-门牌号码";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Storage Default
{
<Data name="DE020100906State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100906State</State>
<StreamLocation>^WS.DE.DE020100906S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
