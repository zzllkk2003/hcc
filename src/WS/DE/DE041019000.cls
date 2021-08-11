Class WS.DE.DE041019000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "听力检测结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:听见;2:听不清或无法听见";

Parameter ValueSet = "DE04.10.190.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.190.00");

Storage Default
{
<Data name="DE041019000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041019000State</State>
<StreamLocation>^WS.DE.DE041019000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
