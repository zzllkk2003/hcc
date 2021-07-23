Class WS.DE.DE060010800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "随访方式代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.207";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.207");

Storage Default
{
<Data name="DE060010800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060010800State</State>
<StreamLocation>^WS.DE.DE060010800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
