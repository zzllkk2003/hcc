Class WS.DE.DE050104700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.013");

Parameter Category = "医学诊断";

Parameter Description = "新生儿并发症代码";

Parameter Format = "AN7";

Parameter ValueSet = "CV05.01.013";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050104700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050104700State</State>
<StreamLocation>^WS.DE.DE050104700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
