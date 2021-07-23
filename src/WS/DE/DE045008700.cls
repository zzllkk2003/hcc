Class WS.DE.DE045008700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "新生儿疾病筛查项目代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.008";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.008");

Storage Default
{
<Data name="DE045008700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045008700State</State>
<StreamLocation>^WS.DE.DE045008700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
