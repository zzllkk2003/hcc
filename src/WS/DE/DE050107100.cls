Class WS.DE.DE050107100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.036");

Parameter Category = "医学诊断";

Parameter Description = "重性精神疾病名称代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.036";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050107100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050107100State</State>
<StreamLocation>^WS.DE.DE050107100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
