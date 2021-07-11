Class WS.DE.DE060025500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "手术级别";

Parameter Format = "N1";

/// Parameter ValueSet = "1:一级手术;2:二级手术;3:三级手术;4:四级手术;";
Parameter ValueSet = "DE06.00.255.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.255.00");

Storage Default
{
<Data name="DE060025500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060025500State</State>
<StreamLocation>^WS.DE.DE060025500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
