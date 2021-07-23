Class WS.DE.DE041006400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "肛门指诊检查结果类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.013";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.013");

Storage Default
{
<Data name="DE041006400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041006400State</State>
<StreamLocation>^WS.DE.DE041006400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
