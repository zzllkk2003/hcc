Class WS.DE.DE050106000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "诊断状态代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.002";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.002");

Storage Default
{
<Data name="DE050106000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050106000State</State>
<StreamLocation>^WS.DE.DE050106000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
