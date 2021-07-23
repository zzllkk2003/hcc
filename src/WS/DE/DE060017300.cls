Class WS.DE.DE060017300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "住院原因";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.212";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.212");

Storage Default
{
<Data name="DE060017300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060017300State</State>
<StreamLocation>^WS.DE.DE060017300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
