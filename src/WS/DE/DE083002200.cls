Class WS.DE.DE083002200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "行政/业务管理职务";

Parameter Format = "N2";

Parameter ValueSet = "GB/T 12403";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.12403");

Storage Default
{
<Data name="DE083002200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083002200State</State>
<StreamLocation>^WS.DE.DE083002200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
