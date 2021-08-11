Class WS.DE.DE060012800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.201");

Parameter Category = "计划与干预";

Parameter Description = "血吸虫病治疗方案代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.201";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE060012800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060012800State</State>
<StreamLocation>^WS.DE.DE060012800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
