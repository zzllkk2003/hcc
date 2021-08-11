Class WS.DE.DE051011100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.010");

Parameter Category = "医学评估";

Parameter Description = "职业病转归代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.010";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051011100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051011100State</State>
<StreamLocation>^WS.DE.DE051011100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
