Class WS.DE.DE040101300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "儿童大便性状代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.01.012";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.012");

Storage Default
{
<Data name="DE040101300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040101300State</State>
<StreamLocation>^WS.DE.DE040101300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
