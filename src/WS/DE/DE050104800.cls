Class WS.DE.DE050104800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "新生儿黄疸程度代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.012";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.012");

Storage Default
{
<Data name="DE050104800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050104800State</State>
<StreamLocation>^WS.DE.DE050104800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
