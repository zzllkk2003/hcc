Class WS.DE.DE060021200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "护理类型代码";

Parameter Format = "N1";

Parameter ValueSet = "1:基础护理;2:特殊护理;3:辨证施护;9:其他;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.212.00");

Storage Default
{
<Data name="DE060021200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060021200State</State>
<StreamLocation>^WS.DE.DE060021200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
