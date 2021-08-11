Class WS.DE.DE051005700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "社会功能情况评价代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:良好;2:一般;3:较差";

Parameter ValueSet = "DE05.10.057.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.057.00");

Storage Default
{
<Data name="DE051005700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051005700State</State>
<StreamLocation>^WS.DE.DE051005700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
