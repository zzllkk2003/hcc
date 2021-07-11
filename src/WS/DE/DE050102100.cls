Class WS.DE.DE050102100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "根本死因代码";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD-10";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD-10");

Storage Default
{
<Data name="DE050102100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102100State</State>
<StreamLocation>^WS.DE.DE050102100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
