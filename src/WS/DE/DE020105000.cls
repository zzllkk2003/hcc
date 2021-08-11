Class WS.DE.DE020105000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "职称级别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:高级职称;2:中级职称;3:初级职称;";

Parameter ValueSet = "DE02.01.050.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE02.01.050.00");

Storage Default
{
<Data name="DE020105000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020105000State</State>
<StreamLocation>^WS.DE.DE020105000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
