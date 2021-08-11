Class WS.DE.DE060007500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "慢性丝虫病患者照料形式代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:自我照料;2:家人照料;3:家庭病床";

Parameter ValueSet = "DE06.00.075.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.075.00");

Storage Default
{
<Data name="DE060007500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060007500State</State>
<StreamLocation>^WS.DE.DE060007500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
