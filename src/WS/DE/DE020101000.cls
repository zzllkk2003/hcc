Class WS.DE.DE020101000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "电话号码";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE020101000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020101000State</State>
<StreamLocation>^WS.DE.DE020101000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
