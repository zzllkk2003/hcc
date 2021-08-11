Class WS.DE.DE020103800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "行政区划代码";

Parameter Format = "N6";

Parameter ValueSet = "GBT.2260";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.2260");

Storage Default
{
<Data name="DE020103800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020103800State</State>
<StreamLocation>^WS.DE.DE020103800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
