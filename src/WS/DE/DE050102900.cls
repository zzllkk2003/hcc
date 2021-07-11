Class WS.DE.DE050102900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "慢性HBV感染临床诊断分类";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.029";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.029");

Storage Default
{
<Data name="DE050102900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102900State</State>
<StreamLocation>^WS.DE.DE050102900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
