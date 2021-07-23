Class WS.DE.DE050104900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "血吸虫病感染方式代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.023";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.023");

Storage Default
{
<Data name="DE050104900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050104900State</State>
<StreamLocation>^WS.DE.DE050104900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
