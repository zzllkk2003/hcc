Class WS.DE.DE045002100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "大便常规检测结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:正常;2:异常;";

Parameter ValueSet = "DE04.50.021.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.021.00");

Storage Default
{
<Data name="DE045002100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045002100State</State>
<StreamLocation>^WS.DE.DE045002100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
