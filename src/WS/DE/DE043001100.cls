Class WS.DE.DE043001100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "附睾检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:正常;2:异常;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.30.011.00");

Storage Default
{
<Data name="DE043001100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043001100State</State>
<StreamLocation>^WS.DE.DE043001100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
