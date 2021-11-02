Class WS.DE.DE081002200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "经济类型代码";

Parameter Format = "N2";

Parameter ValueSet = "GBT.12402.2000";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.12402.2000");

Storage Default
{
<Data name="DE081002200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081002200State</State>
<StreamLocation>^WS.DE.DE081002200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
