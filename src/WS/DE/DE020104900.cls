Class WS.DE.DE020104900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "职称代码";

Parameter Format = "N2";

Parameter ValueSet = "GBT.8561";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.8561");

Storage Default
{
<Data name="DE020104900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020104900State</State>
<StreamLocation>^WS.DE.DE020104900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
