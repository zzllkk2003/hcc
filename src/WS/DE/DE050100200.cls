Class WS.DE.DE050100200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.028");

Parameter Category = "医学诊断";

Parameter Description = "病毒性肝炎类型代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.028";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050100200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050100200State</State>
<StreamLocation>^WS.DE.DE050100200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
