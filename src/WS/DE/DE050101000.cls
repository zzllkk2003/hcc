Class WS.DE.DE050101000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.015");

Parameter Category = "医学诊断";

Parameter Description = "出生缺陷确诊时间类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.015";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050101000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050101000State</State>
<StreamLocation>^WS.DE.DE050101000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
