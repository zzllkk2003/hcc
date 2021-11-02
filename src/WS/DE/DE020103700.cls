Class WS.DE.DE020103700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "所学专业代码";

Parameter Format = "N6";

Parameter ValueSet = "GBT.16835.1997";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.16835.1997");

Storage Default
{
<Data name="DE020103700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020103700State</State>
<StreamLocation>^WS.DE.DE020103700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
