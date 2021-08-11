Class WS.DE.DE051003600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "精神状态代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:正常;2:异常";

Parameter ValueSet = "DE05.10.036.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.036.00");

Storage Default
{
<Data name="DE051003600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051003600State</State>
<StreamLocation>^WS.DE.DE051003600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
