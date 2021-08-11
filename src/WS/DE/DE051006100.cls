Class WS.DE.DE051006100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "生活和劳动能力评价结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:好;2:中;3:差";

Parameter ValueSet = "DE05.10.061.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.061.00");

Storage Default
{
<Data name="DE051006100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051006100State</State>
<StreamLocation>^WS.DE.DE051006100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
