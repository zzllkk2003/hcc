Class WS.DE.DE060008000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "免疫类型代码";

Parameter Format = "N1";

Parameter ValueSet = "1:常规免疫;2:应急免疫;3:强化免疫";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.080.00");

Storage Default
{
<Data name="DE060008000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060008000State</State>
<StreamLocation>^WS.DE.DE060008000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
