Class WS.DE.DE043001300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "肝质地类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:软;2:中等;3:硬;";

Parameter ValueSet = "DE04.30.013.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.30.013.00");

Storage Default
{
<Data name="DE043001300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043001300State</State>
<StreamLocation>^WS.DE.DE043001300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
