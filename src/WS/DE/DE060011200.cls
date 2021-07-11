Class WS.DE.DE060011200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "随访周期建议代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.208";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.208");

Storage Default
{
<Data name="DE060011200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060011200State</State>
<StreamLocation>^WS.DE.DE060011200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
