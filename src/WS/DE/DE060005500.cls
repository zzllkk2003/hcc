Class WS.DE.DE060005500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.114");

Parameter Category = "计划与干预";

Parameter Description = "结核病患者开始治疗方案";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.114";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE060005500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060005500State</State>
<StreamLocation>^WS.DE.DE060005500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
