Class WS.DE.DE081000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "单位隶属关系代码";

Parameter Format = "N1";

Parameter ValueSet = "GBT.12404";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.12404");

Storage Default
{
<Data name="DE081000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081000300State</State>
<StreamLocation>^WS.DE.DE081000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
