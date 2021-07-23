Class WS.DE.DE050106500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "中医体质分类代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.01.005";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.005");

Storage Default
{
<Data name="DE050106500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050106500State</State>
<StreamLocation>^WS.DE.DE050106500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
