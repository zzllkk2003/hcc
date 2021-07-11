Class WS.DE.DE040107000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "睡眠情况代码";

Parameter Format = "N1";

Parameter ValueSet = "1:良好;2:一般;3:较差";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.01.070.00");

Storage Default
{
<Data name="DE040107000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040107000State</State>
<StreamLocation>^WS.DE.DE040107000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
