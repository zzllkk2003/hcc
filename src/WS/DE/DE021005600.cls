Class WS.DE.DE021005600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "妊娠终止方式";

Parameter Format = "N2";

Parameter ValueSet = "CV02.10.002";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.10.002");

Storage Default
{
<Data name="DE021005600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021005600State</State>
<StreamLocation>^WS.DE.DE021005600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
