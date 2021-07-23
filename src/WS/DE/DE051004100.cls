Class WS.DE.DE051004100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "老年人认知功能粗筛结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:粗筛阴性;2:粗筛阳性";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.041.00");

Storage Default
{
<Data name="DE051004100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051004100State</State>
<StreamLocation>^WS.DE.DE051004100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
