Class WS.DE.DE060002500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "放射剂量监测档案建档情况代码";

Parameter Format = "N1";

Parameter ValueSet = "1:全部建立;2:部分建立;3:未建立";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.025.00");

Storage Default
{
<Data name="DE060002500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060002500State</State>
<StreamLocation>^WS.DE.DE060002500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
