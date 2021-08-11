Class WS.DE.DE060015700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "职业健康档案建立情况代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:全部建立;2:部分建立;3:未建立";

Parameter ValueSet = "DE06.00.157.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.157.00");

Storage Default
{
<Data name="DE060015700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060015700State</State>
<StreamLocation>^WS.DE.DE060015700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
