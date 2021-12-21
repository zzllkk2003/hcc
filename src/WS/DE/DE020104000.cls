Class WS.DE.DE020104000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "性别代码";

Parameter Format = "N1";

Parameter ValueSet = "GBT.2261.1.2003";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.2261.1.2003");

Storage Default
{
<Data name="DE020104000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020104000State</State>
<StreamLocation>^WS.DE.DE020104000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
