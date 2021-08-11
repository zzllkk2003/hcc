Class WS.DE.DE040101900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.001");

Parameter Category = "主诉与症状";

Parameter Description = "妇科及乳腺不适症状代码";

Parameter Format = "N2";

Parameter ValueSet = "CV04.01.001";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE040101900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040101900State</State>
<StreamLocation>^WS.DE.DE040101900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
