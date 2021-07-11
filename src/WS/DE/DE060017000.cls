Class WS.DE.DE060017000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "肿瘤患者治疗方式代码";

Parameter Format = "N2";

Parameter ValueSet = "CV06.00.203";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.203");

Storage Default
{
<Data name="DE060017000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060017000State</State>
<StreamLocation>^WS.DE.DE060017000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
