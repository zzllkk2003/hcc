Class WS.DE.DE021004100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "家族近亲婚配者与本人关系";

Parameter Format = "N1";

Parameter ValueSet = "CV02.10.001";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.10.001");

Storage Default
{
<Data name="DE021004100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021004100State</State>
<StreamLocation>^WS.DE.DE021004100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
