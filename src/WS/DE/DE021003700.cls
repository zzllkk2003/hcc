Class WS.DE.DE021003700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "治疗效果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV02.10.005";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.10.005");

Storage Default
{
<Data name="DE021003700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021003700State</State>
<StreamLocation>^WS.DE.DE021003700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
