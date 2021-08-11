Class WS.DE.DE021005000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "免疫接种代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:从未免疫;2:免疫一次或多次;";

Parameter ValueSet = "DE02.10.050.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE02.10.050.00");

Storage Default
{
<Data name="DE021005000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021005000State</State>
<StreamLocation>^WS.DE.DE021005000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
