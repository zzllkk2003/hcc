Class WS.DE.DE060006900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "抗结核治疗停止原因代码";

Parameter Format = "N2";

Parameter ValueSet = "CV06.00.115";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.115");

Storage Default
{
<Data name="DE060006900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060006900State</State>
<StreamLocation>^WS.DE.DE060006900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
