Class WS.DE.DE040103000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "精神症状代码";

Parameter Format = "N2";

Parameter ValueSet = "CV04.01.009";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.009");

Storage Default
{
<Data name="DE040103000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040103000State</State>
<StreamLocation>^WS.DE.DE040103000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
