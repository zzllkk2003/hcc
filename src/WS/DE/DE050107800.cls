Class WS.DE.DE050107800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "损伤中毒的外部原因-疾病编码";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD10";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD10");

Storage Default
{
<Data name="DE050107800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050107800State</State>
<StreamLocation>^WS.DE.DE050107800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
