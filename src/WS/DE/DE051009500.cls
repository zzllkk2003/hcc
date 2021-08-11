Class WS.DE.DE051009500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.014");

Parameter Category = "医学评估";

Parameter Description = "乙肝抗病毒治疗的血清学应答";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.014";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051009500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051009500State</State>
<StreamLocation>^WS.DE.DE051009500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
