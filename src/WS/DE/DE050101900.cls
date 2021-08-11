Class WS.DE.DE050101900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.019");

Parameter Category = "医学诊断";

Parameter Description = "肺外结核部位代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.019";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050101900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050101900State</State>
<StreamLocation>^WS.DE.DE050101900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
