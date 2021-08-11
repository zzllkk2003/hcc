Class WS.DE.DE040101400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.010");

Parameter Category = "主诉与症状";

Parameter Description = "儿童睡眠的质量代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.01.010";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE040101400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040101400State</State>
<StreamLocation>^WS.DE.DE040101400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
