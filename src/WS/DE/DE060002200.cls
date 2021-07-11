Class WS.DE.DE060002200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "儿童预防母婴传播干预措施代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.214";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.214");

Storage Default
{
<Data name="DE060002200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060002200State</State>
<StreamLocation>^WS.DE.DE060002200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
