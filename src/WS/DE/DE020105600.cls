Class WS.DE.DE020105600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "专业技术职务资格";

Parameter Format = "N3";

Parameter ValueSet = "GBT.8561";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.8561");

Storage Default
{
<Data name="DE020105600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020105600State</State>
<StreamLocation>^WS.DE.DE020105600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
