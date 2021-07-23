Class WS.DE.DE060016900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "肿瘤患者指导内容代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.206";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.206");

Storage Default
{
<Data name="DE060016900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060016900State</State>
<StreamLocation>^WS.DE.DE060016900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
