Class WS.DE.DE060007600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.202");

Parameter Category = "计划与干预";

Parameter Description = "慢性丝虫病患者治疗情况";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.202";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE060007600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060007600State</State>
<StreamLocation>^WS.DE.DE060007600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
