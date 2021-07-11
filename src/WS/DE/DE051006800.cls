Class WS.DE.DE051006800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "随访遵医行为评价结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:良好;2:一般;3:差";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.068.00");

Storage Default
{
<Data name="DE051006800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051006800State</State>
<StreamLocation>^WS.DE.DE051006800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
