Class WS.DE.DE030001700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "关锁情况代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:无关锁;2:关锁;3:关锁已解除;";

Parameter ValueSet = "DE03.00.017.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.017.00");

Storage Default
{
<Data name="DE030001700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030001700State</State>
<StreamLocation>^WS.DE.DE030001700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
