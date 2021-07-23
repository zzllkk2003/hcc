Class WS.DE.DE020102200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "结婚日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE020102200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020102200State</State>
<StreamLocation>^WS.DE.DE020102200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
