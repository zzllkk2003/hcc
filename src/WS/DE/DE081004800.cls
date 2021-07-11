Class WS.DE.DE081004800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "肿瘤诊疗机构代码";

Parameter Format = "N1";

Parameter ValueSet = "CV08.10.005";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV08.10.005");

Storage Default
{
<Data name="DE081004800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081004800State</State>
<StreamLocation>^WS.DE.DE081004800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
