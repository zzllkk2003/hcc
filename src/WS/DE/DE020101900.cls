Class WS.DE.DE020101900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "家庭年人均收入类别";

Parameter Format = "N1";

Parameter ValueSet = "CV02.01.203";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.01.203");

Storage Default
{
<Data name="DE020101900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020101900State</State>
<StreamLocation>^WS.DE.DE020101900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
