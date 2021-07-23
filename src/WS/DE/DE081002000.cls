Class WS.DE.DE081002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "监督检验对象代码";

Parameter Format = "N1";

Parameter ValueSet = "CV08.30.003";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV08.30.003");

Storage Default
{
<Data name="DE081002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081002000State</State>
<StreamLocation>^WS.DE.DE081002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
