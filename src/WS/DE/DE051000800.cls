Class WS.DE.DE051000800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "产前筛查方法代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:血清学试验;2:B超检查;9:其他";

Parameter ValueSet = "DE05.10.008.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.008.00");

Storage Default
{
<Data name="DE051000800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051000800State</State>
<StreamLocation>^WS.DE.DE051000800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
