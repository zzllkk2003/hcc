Class WS.DE.DE020102100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "接入互联网方式代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:宽带;2:专线;3:拨号;";

Parameter ValueSet = "DE02.01.021.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE02.01.021.00");

Storage Default
{
<Data name="DE020102100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020102100State</State>
<StreamLocation>^WS.DE.DE020102100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
