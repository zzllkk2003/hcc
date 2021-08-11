Class WS.DE.DE050102403 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "出院中医诊断-主证-编码";

Parameter Format = "AN..5";

Parameter ValueSet = "GBT.156571995";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.156571995");

Storage Default
{
<Data name="DE050102403State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102403State</State>
<StreamLocation>^WS.DE.DE050102403S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
