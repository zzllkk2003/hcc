Class WS.DE.DE081002500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "科室代码";

Parameter Format = "AN..5";

Parameter ValueSet = "GB/T 17538";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.17538");

Storage Default
{
<Data name="DE081002500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081002500State</State>
<StreamLocation>^WS.DE.DE081002500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
