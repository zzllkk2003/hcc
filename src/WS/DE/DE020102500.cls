Class WS.DE.DE020102500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "民族";

Parameter Format = "N2";

Parameter ValueSet = "GBT.3304";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.3304");

Storage Default
{
<Data name="DE020102500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020102500State</State>
<StreamLocation>^WS.DE.DE020102500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
