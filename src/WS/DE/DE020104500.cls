Class WS.DE.DE020104500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "医疗保险类别名称";

Parameter Format = "A..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE020104500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020104500State</State>
<StreamLocation>^WS.DE.DE020104500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
