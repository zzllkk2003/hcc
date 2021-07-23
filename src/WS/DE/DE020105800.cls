Class WS.DE.DE020105800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "户籍类型代码";

Parameter Format = "N1";

// Parameter ValueSet = "1:本地户口;2:非本地户口;3:非本地户口居住一年以上;";

Parameter ValueSet = "DE02.01.058.00";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "DE02.01.058.00");

Storage Default
{
<Data name="DE020105800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020105800State</State>
<StreamLocation>^WS.DE.DE020105800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
