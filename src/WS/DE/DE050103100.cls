Class WS.DE.DE050103100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "农药中毒原因类型代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.035";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.035");

Storage Default
{
<Data name="DE050103100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050103100State</State>
<StreamLocation>^WS.DE.DE050103100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
