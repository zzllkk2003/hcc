Class WS.DE.DE081005200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "组织机构代码";

Parameter Format = "AN10";

Parameter ValueSet = "WS 218";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "WS.218");

Storage Default
{
<Data name="DE081005200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081005200State</State>
<StreamLocation>^WS.DE.DE081005200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
