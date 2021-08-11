Class WS.DE.DE045011300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "乙型肝炎病毒e抗体检测结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:阴性;2:阳性;";

Parameter ValueSet = "DE04.50.113.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.113.00");

Storage Default
{
<Data name="DE045011300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045011300State</State>
<StreamLocation>^WS.DE.DE045011300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
