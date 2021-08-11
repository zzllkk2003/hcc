Class WS.DE.DE045003500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "结核菌群检测结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:结核分枝杆菌;2:非结核分枝杆菌;";

Parameter ValueSet = "DE04.50.035.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.035.00");

Storage Default
{
<Data name="DE045003500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045003500State</State>
<StreamLocation>^WS.DE.DE045003500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
