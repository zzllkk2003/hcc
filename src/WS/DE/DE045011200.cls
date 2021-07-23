Class WS.DE.DE045011200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "乙肝抗病毒治疗的病毒学应答";

Parameter Format = "N1";

Parameter ValueSet = "1:完全病毒学应答;2:部分病毒学应答;3:无应答;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.112.00");

Storage Default
{
<Data name="DE045011200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045011200State</State>
<StreamLocation>^WS.DE.DE045011200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
