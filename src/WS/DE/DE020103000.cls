Class WS.DE.DE020103000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "身份证件号码";

Parameter Format = "AN..18";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 18, MINLEN = 0);

Storage Default
{
<Data name="DE020103000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020103000State</State>
<StreamLocation>^WS.DE.DE020103000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
