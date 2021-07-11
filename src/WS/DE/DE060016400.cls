Class WS.DE.DE060016400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "中药类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.101";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.101");

Storage Default
{
<Data name="DE060016400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060016400State</State>
<StreamLocation>^WS.DE.DE060016400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
