Class WS.DE.DE020103100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "身份证件类别代码";

Parameter Format = "N2";

Parameter ValueSet = "CV02.01.101";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.01.101");

Storage Default
{
<Data name="DE020103100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020103100State</State>
<StreamLocation>^WS.DE.DE020103100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
