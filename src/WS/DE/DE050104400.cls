Class WS.DE.DE050104400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.007");

Parameter Category = "医学诊断";

Parameter Description = "胎方位代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.01.007";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050104400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050104400State</State>
<StreamLocation>^WS.DE.DE050104400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
