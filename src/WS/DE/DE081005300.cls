Class WS.DE.DE081005300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "监督科室代码";

Parameter Format = "N2";

Parameter ValueSet = "CV08.10.003";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV08.10.003");

Storage Default
{
<Data name="DE081005300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081005300State</State>
<StreamLocation>^WS.DE.DE081005300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
