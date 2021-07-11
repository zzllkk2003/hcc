Class WS.DE.DE040110100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "疑似结核患者症状代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.01.007";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.007");

Storage Default
{
<Data name="DE040110100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040110100State</State>
<StreamLocation>^WS.DE.DE040110100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
