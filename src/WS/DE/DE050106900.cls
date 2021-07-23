Class WS.DE.DE050106900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "肿瘤诊断代码";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD-10";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD-10");

Storage Default
{
<Data name="DE050106900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050106900State</State>
<StreamLocation>^WS.DE.DE050106900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
