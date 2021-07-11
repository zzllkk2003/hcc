Class WS.DE.DE060013900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "乙肝抗病毒治疗基本药物";

Parameter Format = "N2";

Parameter ValueSet = "CV06.00.110";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.110");

Storage Default
{
<Data name="DE060013900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060013900State</State>
<StreamLocation>^WS.DE.DE060013900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
