Class WS.DE.DE045001200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "艾滋病阳性检测方法代码";

Parameter Format = "N1";

Parameter ValueSet = "1:确认检测阳性;2:替代策略检测阳性;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.012.00");

Storage Default
{
<Data name="DE045001200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045001200State</State>
<StreamLocation>^WS.DE.DE045001200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
