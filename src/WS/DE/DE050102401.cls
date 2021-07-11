Class WS.DE.DE050102401 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "出院西医诊断-主要诊断-疾病编码";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD-10";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD-10");

Storage Default
{
<Data name="DE050102401State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102401State</State>
<StreamLocation>^WS.DE.DE050102401S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
