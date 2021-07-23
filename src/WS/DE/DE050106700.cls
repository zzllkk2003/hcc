Class WS.DE.DE050106700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "肿瘤临床分期代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.026";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.026");

Storage Default
{
<Data name="DE050106700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050106700State</State>
<StreamLocation>^WS.DE.DE050106700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
