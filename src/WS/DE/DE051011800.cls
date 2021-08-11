Class WS.DE.DE051011800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "重性精神疾病患者随访评价结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:不稳定;2:基本稳定;3:稳定";

Parameter ValueSet = "DE05.10.118.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.118.00");

Storage Default
{
<Data name="DE051011800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051011800State</State>
<StreamLocation>^WS.DE.DE051011800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
