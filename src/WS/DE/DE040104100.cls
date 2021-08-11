Class WS.DE.DE040104100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.008");

Parameter Category = "主诉与症状";

Parameter Description = "慢性丝虫病患者症状/体征代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.01.008";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE040104100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040104100State</State>
<StreamLocation>^WS.DE.DE040104100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
