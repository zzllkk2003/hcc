Class WS.DE.DE030008400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "孕产期高危因素代码";

Parameter Format = "N2";

Parameter ValueSet = "CV03.00.402";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.402");

Storage Default
{
<Data name="DE030008400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030008400State</State>
<StreamLocation>^WS.DE.DE030008400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
