Class WS.DE.DE043004700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "血吸虫患者肝实质纤维化程度代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.30.001";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.30.001");

Storage Default
{
<Data name="DE043004700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043004700State</State>
<StreamLocation>^WS.DE.DE043004700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
