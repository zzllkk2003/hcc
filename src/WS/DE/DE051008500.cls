Class WS.DE.DE051008500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "新生儿苯丙酮尿症筛查代码";

Parameter Format = "N1";

Parameter ValueSet = "1:筛查;2:未筛查";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.085.00");

Storage Default
{
<Data name="DE051008500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051008500State</State>
<StreamLocation>^WS.DE.DE051008500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
