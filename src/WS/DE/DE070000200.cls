Class WS.DE.DE070000200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生费用";

Parameter Description = "门诊费用分类代码";

Parameter Format = "N2";

Parameter ValueSet = "CV07.10.001";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV07.10.001");

Storage Default
{
<Data name="DE070000200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070000200State</State>
<StreamLocation>^WS.DE.DE070000200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
