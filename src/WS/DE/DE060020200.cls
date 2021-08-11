Class WS.DE.DE060020200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "隔离种类代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:消化道隔离;2:呼吸道隔离;3:接触隔离;4:血液-体液隔离;5:严密隔离;6:昆虫隔离;7:保护性隔离;";

Parameter ValueSet = "DE06.00.202.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.202.00");

Storage Default
{
<Data name="DE060020200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060020200State</State>
<StreamLocation>^WS.DE.DE060020200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
