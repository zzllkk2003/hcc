Class WS.DE.DE051005500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "伤害转归代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.011";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.011");

Storage Default
{
<Data name="DE051005500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051005500State</State>
<StreamLocation>^WS.DE.DE051005500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
