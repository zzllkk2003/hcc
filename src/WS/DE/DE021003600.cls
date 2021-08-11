Class WS.DE.DE021003600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "门诊治疗情况代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:未治;2:间断门诊治疗;3:持续门诊治疗;";

Parameter ValueSet = "DE02.10.036.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE02.10.036.00");

Storage Default
{
<Data name="DE021003600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021003600State</State>
<StreamLocation>^WS.DE.DE021003600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
