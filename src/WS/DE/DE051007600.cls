Class WS.DE.DE051007600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "听力筛查代码";

Parameter Format = "N1";

Parameter ValueSet = "1:已筛查;2:未筛查;3:不详";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.076.00");

Storage Default
{
<Data name="DE051007600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051007600State</State>
<StreamLocation>^WS.DE.DE051007600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
