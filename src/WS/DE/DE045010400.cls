Class WS.DE.DE045010400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血吸虫病检测方法代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.017";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.017");

Storage Default
{
<Data name="DE045010400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045010400State</State>
<StreamLocation>^WS.DE.DE045010400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
