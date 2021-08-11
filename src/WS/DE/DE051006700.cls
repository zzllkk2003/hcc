Class WS.DE.DE051006700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "随访饮食合理性评价类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:合理;2:基本合理;3:不合理";

Parameter ValueSet = "DE05.10.067.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.067.00");

Storage Default
{
<Data name="DE051006700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051006700State</State>
<StreamLocation>^WS.DE.DE051006700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
