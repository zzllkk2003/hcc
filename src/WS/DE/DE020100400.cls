Class WS.DE.DE020100400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "出生地类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV02.01.102";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.01.102");

Storage Default
{
<Data name="DE020100400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100400State</State>
<StreamLocation>^WS.DE.DE020100400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
