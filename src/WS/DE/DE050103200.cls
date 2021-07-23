Class WS.DE.DE050103200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "其他疾病诊断";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD-10";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD-10");

Storage Default
{
<Data name="DE050103200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050103200State</State>
<StreamLocation>^WS.DE.DE050103200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
