Class WS.DE.DE060006000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "精神康复措施代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.209";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.209");

Storage Default
{
<Data name="DE060006000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060006000State</State>
<StreamLocation>^WS.DE.DE060006000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
