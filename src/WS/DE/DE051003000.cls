Class WS.DE.DE051003000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "急性乙型肝炎临床分型";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:无黄疸型;2:黄疸型";

Parameter ValueSet = "DE05.10.030.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.030.00");

Storage Default
{
<Data name="DE051003000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051003000State</State>
<StreamLocation>^WS.DE.DE051003000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
