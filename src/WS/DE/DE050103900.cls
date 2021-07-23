Class WS.DE.DE050103900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "伤口愈合状况代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.011";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.011");

Storage Default
{
<Data name="DE050103900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050103900State</State>
<StreamLocation>^WS.DE.DE050103900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
