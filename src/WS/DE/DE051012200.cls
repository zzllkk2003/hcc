Class WS.DE.DE051012200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "自理能力代码";

Parameter Format = "N1";

Parameter ValueSet = "1:完全自理;2:部分自理;3:不能自理";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.122.00");

Storage Default
{
<Data name="DE051012200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051012200State</State>
<StreamLocation>^WS.DE.DE051012200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
