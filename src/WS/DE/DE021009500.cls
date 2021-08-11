Class WS.DE.DE021009500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV02.10.005");

Parameter Category = "健康史";

Parameter Description = "家族性疾病名称代码";

Parameter Format = "N2";

Parameter ValueSet = "CV02.10.005";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE021009500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021009500State</State>
<StreamLocation>^WS.DE.DE021009500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
