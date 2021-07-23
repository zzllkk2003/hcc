Class WS.DE.DE050101500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "放射性疾病的分度代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.033";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.033");

Storage Default
{
<Data name="DE050101500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050101500State</State>
<StreamLocation>^WS.DE.DE050101500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
