Class WS.DE.DE081004000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV08.10.006");

Parameter Category = "卫生机构";

Parameter Description = "血吸虫诊疗机构级别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV08.10.006";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE081004000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081004000State</State>
<StreamLocation>^WS.DE.DE081004000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
