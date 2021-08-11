Class WS.DE.DE050105000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.022");

Parameter Category = "医学诊断";

Parameter Description = "血吸虫病合并症代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.022";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050105000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050105000State</State>
<StreamLocation>^WS.DE.DE050105000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
