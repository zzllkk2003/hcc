Class WS.DE.DE060015200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "孕产妇健康指导类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.219";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.219");

Storage Default
{
<Data name="DE060015200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060015200State</State>
<StreamLocation>^WS.DE.DE060015200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
