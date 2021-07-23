Class WS.DE.DE060009300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "手术/操作代码";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD9CM";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD9CM");

Storage Default
{
<Data name="DE060009300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060009300State</State>
<StreamLocation>^WS.DE.DE060009300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
