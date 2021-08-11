Class WS.DE.DE040111600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "症状代码";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD10R";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD-10.R");

Storage Default
{
<Data name="DE040111600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040111600State</State>
<StreamLocation>^WS.DE.DE040111600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
