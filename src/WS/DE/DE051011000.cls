Class WS.DE.DE051011000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "职业病伤残等级代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.10.004";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.004");

Storage Default
{
<Data name="DE051011000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051011000State</State>
<StreamLocation>^WS.DE.DE051011000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
