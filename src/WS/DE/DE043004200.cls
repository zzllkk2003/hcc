Class WS.DE.DE043004200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "听力筛查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:通过;2:未通过;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.30.042.00");

Storage Default
{
<Data name="DE043004200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043004200State</State>
<StreamLocation>^WS.DE.DE043004200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
