Class WS.DE.DE041003800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.005");

Parameter Category = "体格检查";

Parameter Description = "浮肿程度代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.005";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE041003800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041003800State</State>
<StreamLocation>^WS.DE.DE041003800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
