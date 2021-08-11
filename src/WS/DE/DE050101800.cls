Class WS.DE.DE050101800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.021");

Parameter Category = "医学诊断";

Parameter Description = "肺结核诊断结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.021";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050101800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050101800State</State>
<StreamLocation>^WS.DE.DE050101800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
