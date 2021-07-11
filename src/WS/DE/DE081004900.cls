Class WS.DE.DE081004900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "主要致死疾病的最高诊断机构级别代码";

Parameter Format = "N2";

Parameter ValueSet = "CV08.10.004";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV08.10.004");

Storage Default
{
<Data name="DE081004900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081004900State</State>
<StreamLocation>^WS.DE.DE081004900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
