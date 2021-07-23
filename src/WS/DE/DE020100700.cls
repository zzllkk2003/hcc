Class WS.DE.DE020100700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "传染病患者职业代码";

Parameter Format = "AN..3";

Parameter ValueSet = "CV02.01.202";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.01.202");

Storage Default
{
<Data name="DE020100700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100700State</State>
<StreamLocation>^WS.DE.DE020100700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
