Class WS.DE.DE045006300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿酮体定性检测结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.015";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.015");

Storage Default
{
<Data name="DE045006300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045006300State</State>
<StreamLocation>^WS.DE.DE045006300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
