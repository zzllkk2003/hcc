Class WS.DE.DE060007900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "美沙酮维持治疗终止原因代码";

Parameter Format = "N2";

Parameter ValueSet = "CV06.00.120";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.120");

Storage Default
{
<Data name="DE060007900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060007900State</State>
<StreamLocation>^WS.DE.DE060007900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
