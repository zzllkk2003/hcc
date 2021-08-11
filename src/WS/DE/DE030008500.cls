Class WS.DE.DE030008500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.401");

Parameter Category = "健康危险因素";

Parameter Description = "孕早期服药类别代码";

Parameter Format = "N2";

Parameter ValueSet = "CV03.00.401";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030008500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030008500State</State>
<StreamLocation>^WS.DE.DE030008500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
