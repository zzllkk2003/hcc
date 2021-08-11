Class WS.DE.DE051010500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.010");

Parameter Category = "医学评估";

Parameter Description = "孕妇高危妊娠转归代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.010";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051010500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051010500State</State>
<StreamLocation>^WS.DE.DE051010500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
