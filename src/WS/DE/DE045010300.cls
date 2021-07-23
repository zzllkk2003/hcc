Class WS.DE.DE045010300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血吸虫虫卵检查方法代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.016";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.016");

Storage Default
{
<Data name="DE045010300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045010300State</State>
<StreamLocation>^WS.DE.DE045010300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
