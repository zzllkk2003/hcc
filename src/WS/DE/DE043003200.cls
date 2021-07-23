Class WS.DE.DE043003200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "鞘膜积液累及部位代码";

Parameter Format = "N1";

Parameter ValueSet = "1:左;2:右;3:双侧;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.30.032.00");

Storage Default
{
<Data name="DE043003200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043003200State</State>
<StreamLocation>^WS.DE.DE043003200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
