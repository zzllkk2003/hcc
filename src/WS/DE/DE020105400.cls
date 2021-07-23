Class WS.DE.DE020105400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "中文域名";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE020105400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020105400State</State>
<StreamLocation>^WS.DE.DE020105400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
