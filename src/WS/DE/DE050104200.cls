Class WS.DE.DE050104200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "死亡诊断代码";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD10";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD10");

Storage Default
{
<Data name="DE050104200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050104200State</State>
<StreamLocation>^WS.DE.DE050104200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
