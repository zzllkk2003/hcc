Class WS.DE.DE020100600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "传染病患者归属代码";

Parameter Format = "N1";

Parameter ValueSet = "CV02.01.104";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.01.104");

Storage Default
{
<Data name="DE020100600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100600State</State>
<StreamLocation>^WS.DE.DE020100600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
