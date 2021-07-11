Class WS.DE.DE045007400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "妊娠诊断方法代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.012";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.012");

Storage Default
{
<Data name="DE045007400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045007400State</State>
<StreamLocation>^WS.DE.DE045007400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
