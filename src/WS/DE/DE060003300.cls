Class WS.DE.DE060003300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "宫内节育器取出情况代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:正常;2:异常";

Parameter ValueSet = "DE06.00.033.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.033.00");

Storage Default
{
<Data name="DE060003300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060003300State</State>
<StreamLocation>^WS.DE.DE060003300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
