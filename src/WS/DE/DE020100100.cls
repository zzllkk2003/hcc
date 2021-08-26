Class WS.DE.DE020100100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "参加工作日期";

Parameter Format = "D8";

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE020100100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100100State</State>
<StreamLocation>^WS.DE.DE020100100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
