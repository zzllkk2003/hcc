Class WS.DE.DE051008300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "心理调整评价结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:良好;2:一般;3:差";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.083.00");

Storage Default
{
<Data name="DE051008300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051008300State</State>
<StreamLocation>^WS.DE.DE051008300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
