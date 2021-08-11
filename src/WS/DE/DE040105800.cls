Class WS.DE.DE040105800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.002");

Parameter Category = "主诉与症状";

Parameter Description = "乳汁量代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.01.002";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE040105800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040105800State</State>
<StreamLocation>^WS.DE.DE040105800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
