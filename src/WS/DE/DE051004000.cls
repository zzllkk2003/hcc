Class WS.DE.DE051004000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "老年人情感状态粗筛结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:粗筛阴性;2:粗筛阳性";

Parameter ValueSet = "DE05.10.040.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.040.00");

Storage Default
{
<Data name="DE051004000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051004000State</State>
<StreamLocation>^WS.DE.DE051004000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
