Class WS.DE.DE051009700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "营养状态代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:良好;2:中等;3:差";

Parameter ValueSet = "DE05.10.097.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.097.00");

Storage Default
{
<Data name="DE051009700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051009700State</State>
<StreamLocation>^WS.DE.DE051009700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
