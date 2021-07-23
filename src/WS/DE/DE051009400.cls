Class WS.DE.DE051009400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "乙肝患者病情转归";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.015";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.015");

Storage Default
{
<Data name="DE051009400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051009400State</State>
<StreamLocation>^WS.DE.DE051009400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
