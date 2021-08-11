Class WS.DE.DE051015500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "胎膜情况代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:已破;2:未破;";

Parameter ValueSet = "DE05.10.155.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.155.00");

Storage Default
{
<Data name="DE051015500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051015500State</State>
<StreamLocation>^WS.DE.DE051015500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
