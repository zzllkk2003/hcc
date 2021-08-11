Class WS.DE.DE060007300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.103");

Parameter Category = "计划与干预";

Parameter Description = "麻醉方法代码";

Parameter Format = "N..2";

Parameter ValueSet = "CV06.00.103";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE060007300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060007300State</State>
<StreamLocation>^WS.DE.DE060007300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
