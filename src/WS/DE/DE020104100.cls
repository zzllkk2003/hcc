Class WS.DE.DE020104100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "学历代码";

Parameter Format = "N2";

Parameter ValueSet = "GBT.4658";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.4658");

Storage Default
{
<Data name="DE020104100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020104100State</State>
<StreamLocation>^WS.DE.DE020104100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
