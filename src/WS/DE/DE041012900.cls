Class WS.DE.DE041012900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.004");

Parameter Category = "体格检查";

Parameter Description = "皮肤检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.004";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE041012900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041012900State</State>
<StreamLocation>^WS.DE.DE041012900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
