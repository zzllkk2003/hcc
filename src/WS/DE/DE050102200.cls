Class WS.DE.DE050102200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "过敏源";

Parameter Format = "N..3";

Parameter ValueSet = "CV05.01.038";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.038");

Storage Default
{
<Data name="DE050102200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102200State</State>
<StreamLocation>^WS.DE.DE050102200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
