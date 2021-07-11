Class WS.DE.DE051004700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "年龄别体重评价结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.006";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.006");

Storage Default
{
<Data name="DE051004700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051004700State</State>
<StreamLocation>^WS.DE.DE051004700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
