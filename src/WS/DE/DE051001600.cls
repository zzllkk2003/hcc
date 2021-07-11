Class WS.DE.DE051001600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "传染病类别代码";

Parameter Format = "N1";

Parameter ValueSet = "1:甲类;2:乙类;3:丙类";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.016.00");

Storage Default
{
<Data name="DE051001600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051001600State</State>
<StreamLocation>^WS.DE.DE051001600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
