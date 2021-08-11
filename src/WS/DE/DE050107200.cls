Class WS.DE.DE050107200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.001");

Parameter Category = "医学诊断";

Parameter Description = "住院者疾病状态代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.001";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050107200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050107200State</State>
<StreamLocation>^WS.DE.DE050107200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
