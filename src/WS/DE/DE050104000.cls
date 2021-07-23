Class WS.DE.DE050104000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "首次确诊晚期血吸虫病病例类型代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.025";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.025");

Storage Default
{
<Data name="DE050104000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050104000State</State>
<StreamLocation>^WS.DE.DE050104000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
