Class WS.DE.DE045006900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "取出皮下埋植剂检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:正常;2:异常;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.069.00");

Storage Default
{
<Data name="DE045006900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045006900State</State>
<StreamLocation>^WS.DE.DE045006900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
