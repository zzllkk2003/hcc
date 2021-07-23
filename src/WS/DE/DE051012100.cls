Class WS.DE.DE051012100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "转归代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.010";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.010");

Storage Default
{
<Data name="DE051012100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051012100State</State>
<StreamLocation>^WS.DE.DE051012100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
