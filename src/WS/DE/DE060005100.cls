Class WS.DE.DE060005100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "健康指导代码";

Parameter Format = "N1";

Parameter ValueSet = "1:纳入慢性病患者健康管理;2:建议复检;3:建议转诊";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.051.00");

Storage Default
{
<Data name="DE060005100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060005100State</State>
<StreamLocation>^WS.DE.DE060005100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
