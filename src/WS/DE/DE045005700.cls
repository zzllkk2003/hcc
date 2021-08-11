Class WS.DE.DE045005700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.015");

Parameter Category = "实验室检查";

Parameter Description = "尿潜血检测结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.015";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE045005700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045005700State</State>
<StreamLocation>^WS.DE.DE045005700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
