Class WS.DE.DE051003400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "健康状况代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:良好;2:一般;3:差";

Parameter ValueSet = "DE05.10.034.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.034.00");

Storage Default
{
<Data name="DE051003400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051003400State</State>
<StreamLocation>^WS.DE.DE051003400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
