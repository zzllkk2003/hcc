Class WS.DE.DE020104700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "邮政编码";

Parameter Format = "N6";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(PATTERN = "6N");

Storage Default
{
<Data name="DE020104700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020104700State</State>
<StreamLocation>^WS.DE.DE020104700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
