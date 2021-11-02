Class WS.DE.DE020104200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "学位代码";

Parameter Format = "N8";

Parameter ValueSet = "GBT.6864.2003";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.6864.2003");

Storage Default
{
<Data name="DE020104200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020104200State</State>
<StreamLocation>^WS.DE.DE020104200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
