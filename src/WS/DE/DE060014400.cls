Class WS.DE.DE060014400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "乙肝治疗方法代码";

Parameter Format = "N2";

Parameter ValueSet = "CV06.00.112";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.112");

Storage Default
{
<Data name="DE060014400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060014400State</State>
<StreamLocation>^WS.DE.DE060014400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
