Class WS.DE.DE051009600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "乙型肝炎肝硬化分期代码";

Parameter Format = "N1";

Parameter ValueSet = "1:代偿期;2:失代偿期";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.096.00");

Storage Default
{
<Data name="DE051009600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051009600State</State>
<StreamLocation>^WS.DE.DE051009600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
