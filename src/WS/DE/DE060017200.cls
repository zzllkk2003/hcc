Class WS.DE.DE060017200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "重性精神疾病患者干预类型";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:病情稳定;2:病情基本稳定;3:病情不稳定";

Parameter ValueSet = "DE06.00.172.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.172.00");

Storage Default
{
<Data name="DE060017200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060017200State</State>
<StreamLocation>^WS.DE.DE060017200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
