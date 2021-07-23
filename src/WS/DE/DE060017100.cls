Class WS.DE.DE060017100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "肿瘤首次手术性质代码";

Parameter Format = "N1";

Parameter ValueSet = "1:根治;2:姑息;3:探查";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.171.00");

Storage Default
{
<Data name="DE060017100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060017100State</State>
<StreamLocation>^WS.DE.DE060017100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
