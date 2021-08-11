Class WS.DE.DE041015900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.012");

Parameter Category = "体格检查";

Parameter Description = "乳腺检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.012";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE041015900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041015900State</State>
<StreamLocation>^WS.DE.DE041015900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
