Class WS.DE.DE043005000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "直肠镜检查结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:阳性;2:阴性;3:未查;";

Parameter ValueSet = "DE04.30.050.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.30.050.00");

Storage Default
{
<Data name="DE043005000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043005000State</State>
<StreamLocation>^WS.DE.DE043005000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
