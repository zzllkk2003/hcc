Class WS.DE.DE051001500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "传染病发病类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:急性;2:慢性";

Parameter ValueSet = "DE05.10.015.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.015.00");

Storage Default
{
<Data name="DE051001500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051001500State</State>
<StreamLocation>^WS.DE.DE051001500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
