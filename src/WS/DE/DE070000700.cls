Class WS.DE.DE070000700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV07.10.003");

Parameter Category = "卫生费用";

Parameter Description = "医疗费用支付方式代码";

Parameter Format = "N1";

Parameter ValueSet = "CV07.10.003";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE070000700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070000700State</State>
<StreamLocation>^WS.DE.DE070000700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
