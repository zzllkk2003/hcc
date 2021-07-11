Class WS.DE.DE045010500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血吸虫病抗体检测方法代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.018";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.018");

Storage Default
{
<Data name="DE045010500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045010500State</State>
<StreamLocation>^WS.DE.DE045010500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
