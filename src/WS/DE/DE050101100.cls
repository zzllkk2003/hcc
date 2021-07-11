Class WS.DE.DE050101100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "出生缺陷诊断依据代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.014";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.014");

Storage Default
{
<Data name="DE050101100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050101100State</State>
<StreamLocation>^WS.DE.DE050101100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
