Class WS.DE.DE041024100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "脐带检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.019";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.019");

Storage Default
{
<Data name="DE041024100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041024100State</State>
<StreamLocation>^WS.DE.DE041024100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
