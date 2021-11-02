Class WS.DE.DE081004100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "业务用房面积(m2)";

Parameter Format = "N..8,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="DE081004100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081004100State</State>
<StreamLocation>^WS.DE.DE081004100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
