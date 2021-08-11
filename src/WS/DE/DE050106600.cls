Class WS.DE.DE050106600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "UICC");

Parameter Category = "医学诊断";

Parameter Description = "肿瘤TNM分期代码";

Parameter Format = "N1";

Parameter ValueSet = "UICC";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050106600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050106600State</State>
<StreamLocation>^WS.DE.DE050106600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
