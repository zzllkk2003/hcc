Class WS.DE.DE051000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "步态情况";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:未见异常;2:异常";

Parameter ValueSet = "DE05.10.005.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.005.00");

Storage Default
{
<Data name="DE051000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051000500State</State>
<StreamLocation>^WS.DE.DE051000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
