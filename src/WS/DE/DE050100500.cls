Class WS.DE.DE050100500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.009");

Parameter Category = "医学诊断";

Parameter Description = "产时并发症代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.01.009";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050100500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050100500State</State>
<StreamLocation>^WS.DE.DE050100500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
