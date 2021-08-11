Class WS.DE.DE060026500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输血反应类型";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:发热;2:过敏;3:溶血;9:其他;";

Parameter ValueSet = "DE06.00.265.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.265.00");

Storage Default
{
<Data name="DE060026500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060026500State</State>
<StreamLocation>^WS.DE.DE060026500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
