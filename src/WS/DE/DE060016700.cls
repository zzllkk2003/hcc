Class WS.DE.DE060016700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "肿瘤病情告知患者情况类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:是;2:否;3:不详";

Parameter ValueSet = "DE06.00.167.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.167.00");

Storage Default
{
<Data name="DE060016700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060016700State</State>
<StreamLocation>^WS.DE.DE060016700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
