Class WS.DE.DE045011600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "乙型肝炎病毒表面抗原检测结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:阴性;2:阳性;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.116.00");

Storage Default
{
<Data name="DE045011600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045011600State</State>
<StreamLocation>^WS.DE.DE045011600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
