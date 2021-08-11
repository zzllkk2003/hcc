Class WS.DE.DE043001700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "检查/检验结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:正常;2:异常;3:不确定;";

Parameter ValueSet = "DE04.30.017.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.30.017.00");

Storage Default
{
<Data name="DE043001700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043001700State</State>
<StreamLocation>^WS.DE.DE043001700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
