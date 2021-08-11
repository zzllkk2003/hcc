Class WS.DE.DE051011500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "肿瘤患者目前疾病情况类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:稳定;2:好转;3:恶化";

Parameter ValueSet = "DE05.10.115.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.115.00");

Storage Default
{
<Data name="DE051011500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051011500State</State>
<StreamLocation>^WS.DE.DE051011500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
