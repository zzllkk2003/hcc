Class WS.DE.DE050101600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.034");

Parameter Category = "医学诊断";

Parameter Description = "放射性疾病的分期代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.034";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050101600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050101600State</State>
<StreamLocation>^WS.DE.DE050101600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
