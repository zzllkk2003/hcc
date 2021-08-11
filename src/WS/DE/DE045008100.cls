Class WS.DE.DE045008100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "痰检涂片结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:阳性;2:阴性;3:未查;";

Parameter ValueSet = "DE04.50.081.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.081.00");

Storage Default
{
<Data name="DE045008100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045008100State</State>
<StreamLocation>^WS.DE.DE045008100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
