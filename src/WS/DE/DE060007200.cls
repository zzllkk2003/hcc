Class WS.DE.DE060007200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "流产方法代码";

Parameter Format = "N1";

Parameter ValueSet = "1:药物流产;2:人工流产";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.072.00");

Storage Default
{
<Data name="DE060007200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060007200State</State>
<StreamLocation>^WS.DE.DE060007200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
