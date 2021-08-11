Class WS.DE.DE045012900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.019");

Parameter Category = "实验室检查";

Parameter Description = "阴道分泌物检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.019";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE045012900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045012900State</State>
<StreamLocation>^WS.DE.DE045012900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
