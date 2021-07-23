Class WS.DE.DE051011300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "治疗结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.010";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.010");

Storage Default
{
<Data name="DE051011300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051011300State</State>
<StreamLocation>^WS.DE.DE051011300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
