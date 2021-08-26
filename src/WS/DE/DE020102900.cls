Class WS.DE.DE020102900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "迁入日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE020102900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020102900State</State>
<StreamLocation>^WS.DE.DE020102900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
