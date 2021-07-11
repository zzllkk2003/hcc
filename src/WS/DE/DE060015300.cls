Class WS.DE.DE060015300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "孕产妇死亡时间类别代码";

Parameter Format = "N1";

Parameter ValueSet = "1:产前;2:产时;3:产后";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.153.00");

Storage Default
{
<Data name="DE060015300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060015300State</State>
<StreamLocation>^WS.DE.DE060015300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
