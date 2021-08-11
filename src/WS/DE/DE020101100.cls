Class WS.DE.DE020101100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "电话类别";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE020101100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020101100State</State>
<StreamLocation>^WS.DE.DE020101100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
