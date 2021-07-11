Class WS.DE.DE045011100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "药敏试验结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.013";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.013");

Storage Default
{
<Data name="DE045011100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045011100State</State>
<StreamLocation>^WS.DE.DE045011100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
