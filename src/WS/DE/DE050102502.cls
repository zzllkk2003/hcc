Class WS.DE.DE050102502 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "出院中医诊断-主病";

Parameter Format = "AN..5";

Parameter ValueSet = "GBT.15657.1995";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.15657.1995");

Storage Default
{
<Data name="DE050102502State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102502State</State>
<StreamLocation>^WS.DE.DE050102502S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
