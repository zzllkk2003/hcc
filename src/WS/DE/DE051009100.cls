Class WS.DE.DE051009100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "血吸虫病患者劳动能力分级代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.008";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.008");

Storage Default
{
<Data name="DE051009100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051009100State</State>
<StreamLocation>^WS.DE.DE051009100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
