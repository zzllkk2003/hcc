Class WS.DE.DE045005000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿蛋白定性检测结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.015";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.015");

Storage Default
{
<Data name="DE045005000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045005000State</State>
<StreamLocation>^WS.DE.DE045005000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
