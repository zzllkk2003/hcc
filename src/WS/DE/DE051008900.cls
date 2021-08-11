Class WS.DE.DE051008900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "新生儿甲低筛查代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:筛查;2:未筛查";

Parameter ValueSet = "DE05.10.089.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.089.00");

Storage Default
{
<Data name="DE051008900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051008900State</State>
<StreamLocation>^WS.DE.DE051008900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
