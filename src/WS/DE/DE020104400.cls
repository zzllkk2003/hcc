Class WS.DE.DE020104400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "医疗保险类别代码";

Parameter Format = "N2";

Parameter ValueSet = "CV02.01.204";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.01.204");

Storage Default
{
<Data name="DE020104400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020104400State</State>
<StreamLocation>^WS.DE.DE020104400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
