Class WS.DE.DE045002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "肝功能检测结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:正常;2:异常;";

Parameter ValueSet = "DE04.50.026.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.026.00");

Storage Default
{
<Data name="DE045002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045002600State</State>
<StreamLocation>^WS.DE.DE045002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
