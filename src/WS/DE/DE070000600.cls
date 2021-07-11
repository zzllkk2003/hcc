Class WS.DE.DE070000600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生费用";

Parameter Description = "医疗费用结算方式代码";

Parameter Format = "N2";

Parameter ValueSet = "CV07.10.004";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV07.10.004");

Storage Default
{
<Data name="DE070000600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070000600State</State>
<StreamLocation>^WS.DE.DE070000600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
