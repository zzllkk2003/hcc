Class WS.DE.DE050100900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "出生缺陷类别代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.01.016";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.016");

Storage Default
{
<Data name="DE050100900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050100900State</State>
<StreamLocation>^WS.DE.DE050100900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
