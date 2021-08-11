Class WS.DE.DE040110600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "月经出血量类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:多;2:中;3:少";

Parameter ValueSet = "DE04.01.106.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.01.106.00");

Storage Default
{
<Data name="DE040110600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040110600State</State>
<StreamLocation>^WS.DE.DE040110600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
