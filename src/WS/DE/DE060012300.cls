Class WS.DE.DE060012300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.108");

Parameter Category = "计划与干预";

Parameter Description = "新生儿抢救方法代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.108";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE060012300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060012300State</State>
<StreamLocation>^WS.DE.DE060012300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
