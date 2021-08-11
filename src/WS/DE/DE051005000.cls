Class WS.DE.DE051005000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "贫血分级代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:轻;2:中;3:重";

Parameter ValueSet = "DE05.10.050.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.050.00");

Storage Default
{
<Data name="DE051005000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051005000State</State>
<StreamLocation>^WS.DE.DE051005000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
