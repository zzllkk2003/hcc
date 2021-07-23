Class WS.DE.DE020104300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "血缘关系代码";

Parameter Format = "N1";

Parameter ValueSet = "CV02.01.201";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.01.201");

Storage Default
{
<Data name="DE020104300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020104300State</State>
<StreamLocation>^WS.DE.DE020104300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
