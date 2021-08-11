Class WS.DE.DE020102000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "监护人与本人关系代码";

Parameter Format = "N2";

Parameter ValueSet = "GBT.4761";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.4761");

Storage Default
{
<Data name="DE020102000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020102000State</State>
<StreamLocation>^WS.DE.DE020102000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
