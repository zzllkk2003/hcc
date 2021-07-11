Class WS.DE.DE045008900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血常规检测结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:正常;2:异常;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.089.00");

Storage Default
{
<Data name="DE045008900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045008900State</State>
<StreamLocation>^WS.DE.DE045008900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
