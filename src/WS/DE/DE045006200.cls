Class WS.DE.DE045006200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.015");

Parameter Category = "实验室检查";

Parameter Description = "尿糖定性检测结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.015";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE045006200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045006200State</State>
<StreamLocation>^WS.DE.DE045006200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
