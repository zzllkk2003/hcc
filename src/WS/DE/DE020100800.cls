Class WS.DE.DE020100800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "传真号码";

Parameter Format = "N..18";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 18, MINLEN = 0);

Storage Default
{
<Data name="DE020100800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100800State</State>
<StreamLocation>^WS.DE.DE020100800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
