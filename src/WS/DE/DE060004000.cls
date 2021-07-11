Class WS.DE.DE060004000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "婚检医学意见代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.210";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.210");

Storage Default
{
<Data name="DE060004000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060004000State</State>
<StreamLocation>^WS.DE.DE060004000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
