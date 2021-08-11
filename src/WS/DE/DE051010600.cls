Class WS.DE.DE051010600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "运动功能状态代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:可顺利完成;2:无法独立完成其中任何一个动作";

Parameter ValueSet = "DE05.10.106.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.106.00");

Storage Default
{
<Data name="DE051010600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051010600State</State>
<StreamLocation>^WS.DE.DE051010600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
