Class WS.DE.DE041020100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.014");

Parameter Category = "体格检查";

Parameter Description = "下肢水肿检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.014";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE041020100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041020100State</State>
<StreamLocation>^WS.DE.DE041020100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
