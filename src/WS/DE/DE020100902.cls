Class WS.DE.DE020100902 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "地址-市(地区、州)";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Storage Default
{
<Data name="DE020100902State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100902State</State>
<StreamLocation>^WS.DE.DE020100902S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
