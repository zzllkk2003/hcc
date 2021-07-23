Class WS.DE.DE045012000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "阴道细胞学诊断结果代码";

Parameter Format = "N2";

Parameter ValueSet = "CV04.50.011";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.011");

Storage Default
{
<Data name="DE045012000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045012000State</State>
<StreamLocation>^WS.DE.DE045012000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
