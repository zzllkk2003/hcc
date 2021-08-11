Class WS.DE.DE060003000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.113");

Parameter Category = "计划与干预";

Parameter Description = "更换抗HBV药物方案原因";

Parameter Format = "N2";

Parameter ValueSet = "CV06.00.113";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE060003000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060003000State</State>
<StreamLocation>^WS.DE.DE060003000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
