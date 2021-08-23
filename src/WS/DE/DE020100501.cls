Class WS.DE.DE020100501 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "出生日期";

Parameter Format = "D8";

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE020100501State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100501State</State>
<StreamLocation>^WS.DE.DE020100501S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
